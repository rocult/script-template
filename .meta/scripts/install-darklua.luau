-- Dependencies
local exec = require("./helpers/exec")

-- The exact rev to install for darklua
local GIT = "https://github.com/Stefanuk12/darklua"
local REV = "71781a61d7ad7e80953c12c6bb55781f9f14370e"

-- Install via cargo, which checks if it's already installed, etc.
print(`Installing darklua {REV}...`)
exec("cargo", {
    "install",
    "--git",
    GIT,
    "--rev",
    REV,
}, { stdio = "forward" })
print(`darklua {REV} installed`)
