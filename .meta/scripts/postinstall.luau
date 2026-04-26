-- Dependencies
local exec = require("./helpers/exec")

-- Sets up lune, pesde, and darklua after `mise install` is ran
exec("lune", { "setup" })
exec("pesde", { "install" })
exec("mise", { "install-darklua" })
