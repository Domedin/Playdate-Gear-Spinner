local pd <const> = playdate
local gfx <const> = pd.graphics

class('Gear').extends(gfx.sprite)

function Gear:init(x, y)
    local gearImage = gfx.image.new("images/Gear")
    self:setImage(gearImage)
    Gear.super.init(self, gearImage)
    self:moveTo(x, y)
    self:add()
    self:setCollideRect(0, 0, self:getSize())
    self.rotation = 0
    self.x = x
    self.y = y
    self.angle = 0
end

function Gear:update()
    self:Rotation()
end

function Gear:Rotation()
    self:setRotation(self.angle)
    --Gear:angleChangeFunction(playdate.getCrankChange())
    self.angle += 1
end

function Gear:angleChangeFunction(angleChange)
    angleChange = angleChange / 90
    if angleChange ~= 0 then
        self.angle += 1 * math.abs(angleChange)
    end
    self.angle += 1
end