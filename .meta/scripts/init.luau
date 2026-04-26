-- Dependencies
local fs = require("@lune/fs")
local process = require("@lune/process")
local stdio = require("@lune/stdio")

-- Patterns used to extract / replace top-level fields in pesde.toml
local NAME_PATTERN = 'name = "([^"]*)"'
local DESC_PATTERN = 'description = "([^"]*)"'
local VERSION_PATTERN = 'version = "([^"]*)"'
local LICENSE_PATTERN = 'license = "([^"]*)"'
local AUTHORS_PATTERN = "authors = (%b[])"

-- Required format for the package name, e.g. "scope/name"
local NAME_FORMAT = "^[^/%s]+/[^/%s]+$"

-- Type alias for the values read from pesde.toml
type CurrentValues = {
    name: string,
    desc: string,
    version: string,
    license: string,
    authors: string,
}

--- Prompts the user for input, returning the default if they leave it blank.
local function ask(text: string, default: string?): string
    local hint = if default ~= nil and default ~= "" then ` [{default}]` else ""
    local answer = stdio.prompt("text", `{text}{hint}`)
    if answer == nil or answer == "" then
        return default or ""
    end

    return answer
end

--- Escape a string for safe insertion into a TOML basic string ("...").
local function escapeTOML(s: string): string
    local out = s
    out = out:gsub("\\", "\\\\")
    out = out:gsub('"', '\\"')

    return out
end

--- gsub-safe replacement (escapes the `%` char, which has special meaning).
local function literalRepl(s: string): string
    local out: string = s:gsub("%%", "%%%%")

    return out
end

--- Returns true if the name matches the required `scope/name` format.
local function validateName(name: string): boolean
    return name:match(NAME_FORMAT) ~= nil
end

--- Replace a field in the pesde.toml content via gsub, warning if not found.
local function replaceField(text: string, pattern: string, replacement: string): string
    local replaced, count = text:gsub(pattern, literalRepl(replacement), 1)
    if count == 0 then
        stdio.ewrite(`Warning: pattern '{pattern}' not found in pesde.toml\n`)
    end

    return replaced
end

--- Read the current pesde.toml content, returning each top-level field's value.
local function readCurrentValues(text: string): CurrentValues
    return {
        name = text:match(NAME_PATTERN) or "",
        desc = text:match(DESC_PATTERN) or "",
        version = text:match(VERSION_PATTERN) or "0.1.0",
        license = text:match(LICENSE_PATTERN) or "MIT",
        authors = text:match(AUTHORS_PATTERN) or "[]",
    }
end

--- Prompt the user for a valid package name, looping until the input is valid.
local function promptName(initial: string?, default: string): string
    local candidate = initial
    while true do
        if candidate == nil then
            candidate = ask("Package name (scope/name)", default)
        end
        if validateName(candidate :: string) then
            return candidate :: string
        end

        stdio.ewrite(`'{candidate}' is not in scope/name format. Try again.\n`)
        candidate = nil
    end
end

--- Build the authors TOML array from a comma-separated string, falling back if blank.
local function buildAuthorsTOML(input: string, fallback: string): string
    if input == "" then
        return fallback
    end

    local list = {}
    for author in input:gmatch("[^,]+") do
        local trimmed = author:match("^%s*(.-)%s*$")
        if trimmed ~= nil and trimmed ~= "" then
            table.insert(list, `"{escapeTOML(trimmed)}"`)
        end
    end

    return `[{table.concat(list, ", ")}]`
end

-- Read current values from pesde.toml to use as defaults
local pesde = fs.readFile("pesde.toml")
local current = readCurrentValues(pesde)

-- Prompt for each field
print("Renaming project. Leave a field blank to keep the current value.\n")
local newName = promptName(process.args[1], current.name)
local shortName = newName:match("/(.+)$") :: string
local description = ask("Description", current.desc)
local version = ask("Version", current.version)
local license = ask("License", current.license)
local authorsTOML = buildAuthorsTOML(ask("Authors (comma-separated)", ""), current.authors)

-- Apply edits to pesde.toml
pesde = replaceField(pesde, NAME_PATTERN, `name = "{escapeTOML(newName)}"`)
pesde = replaceField(pesde, DESC_PATTERN, `description = "{escapeTOML(description)}"`)
pesde = replaceField(pesde, VERSION_PATTERN, `version = "{escapeTOML(version)}"`)
pesde = replaceField(pesde, LICENSE_PATTERN, `license = "{escapeTOML(license)}"`)
pesde = replaceField(pesde, AUTHORS_PATTERN, `authors = {authorsTOML}`)
fs.writeFile("pesde.toml", pesde)

-- Apply edit to default.project.json
local proj = fs.readFile("default.project.json")
local newProj = proj:gsub('"name"%s*:%s*"[^"]*"', literalRepl(`"name": "{escapeTOML(shortName)}"`), 1)
fs.writeFile("default.project.json", newProj)

-- Summary
print("")
print(`Renamed to {newName}`)
print(`  description: {description}`)
print(`  version:     {version}`)
print(`  license:     {license}`)
print(`  authors:     {authorsTOML}`)
