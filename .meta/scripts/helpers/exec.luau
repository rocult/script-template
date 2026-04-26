-- Dependencies
local process = require("@lune/process")

--- Executes a shell command, exiting the process if there was an error.
local function exec(program: string, params: { string }?, options: process.ExecOptions?)
    local result = process.exec(program, params, options)
    if not result.ok then
        process.exit(result.code)
    end

    return result
end

return exec
