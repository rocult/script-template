local Gun = require("@modules/gun")
local LocalPlayer = require("@core/player")
local Promise = require("@pkgs/promise")

print(LocalPlayer)
print(Promise)

local OurGun = Gun.new()
OurGun:shoot()
