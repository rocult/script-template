-- Dependencies
local fs = require("@lune/fs")

-- All of the automatically generated paths
local paths = {
    "dist",
    "roblox.d.luau",
    "roblox_packages",
    "luau_packages",
    "lune_packages",
    ".pesde",
    ".meta/sourcemap.json",
}

-- Go through each path and delete it all
for _, path in paths do
    if fs.isDir(path) then
        fs.removeDir(path)
    elseif fs.isFile(path) then
        fs.removeFile(path)
    end
end

print("Cleaned. Run 'mise install' to restore tooling and dependencies.")
