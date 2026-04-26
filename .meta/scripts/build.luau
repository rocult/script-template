-- Dependencies
local exec = require("./helpers/exec")
local fs = require("@lune/fs")
local process = require("@lune/process")
local stdio = require("@lune/stdio")

-- Constants
local META_DIR = ".meta"
local CONFIG_PATTERN = "^%.darklua%.(.+)%-build%.json$"

--- Discover all variants by scanning `.meta/` for matching config files.
local function discoverVariants(): { string }
    local variants = {}
    for _, entry in fs.readDir(META_DIR) do
        local variant: string? = entry:match(CONFIG_PATTERN)
        if variant ~= nil then
            table.insert(variants, variant)
        end
    end
    table.sort(variants)

    return variants
end

-- Make sure we have at least one config file
local available: { string } = discoverVariants()
if #available == 0 then
    stdio.ewrite(`No darklua configs found in {META_DIR}/ matching .darklua.<variant>-build.json\n`)
    process.exit(1)
    return
end

-- Decide which variants to build.
local variants: { string }
if #process.args == 0 then
    variants = available
else
    variants = process.args

    -- Validate every requested variant has a matching config file.
    for _, requested in variants do
        local found = false
        for _, v in available do
            if v == requested then
                found = true
                break
            end
        end

        if not found then
            stdio.ewrite(`Unknown variant '{requested}'. Available: {table.concat(available, ", ")}\n`)
            process.exit(1)
            return
        end
    end
end

for _, variant in variants do
    print(`[build] {variant}`)
    exec("darklua", {
        "process",
        "src/init.luau",
        `dist/{variant}-build.lua`,
        "-c",
        `{META_DIR}/.darklua.{variant}-build.json`,
    }, { stdio = "forward" })
end
