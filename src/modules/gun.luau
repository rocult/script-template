local Gun = {}
Gun.__index = Gun

export type GunData = {
    ammo: number,
}
export type Gun = typeof(setmetatable({} :: GunData, Gun))

function Gun.new()
    local self = setmetatable({}, Gun)
    self.ammo = 30
    return self
end

function Gun.shoot(self: Gun)
    if self.ammo > 0 then
        self.ammo -= 1
        print("Bang!")
    else
        print("Click!")
    end
end

return Gun
