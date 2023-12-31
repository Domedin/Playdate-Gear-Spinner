local pd <const> = playdate
local gfx <const> = pd.graphics

class('Gear').extends(gfx.sprite)

--Creates the gear
function Gear:init(x, y)
    local gearImage = gfx.image.new("images/Gear/Gear")
    self:setImage(gearImage)
    Gear.super.init(self, gearImage)
    self:moveTo(x, y)
    self:add()
    self.x = x
    self.y = y
    self.angle = 0
    self.canGetPoint = true
end

function Gear:update()
    self:Rotate()
    self:RotationScore()
end

--Spins the gear based on how quickly the crank is spun
function Gear:Rotate()
    angleChange, angleAcceleratedChange = playdate.getCrankChange()
    angleChange = math.abs(angleChange / 4)
    if angleChange > 4 then
        angleChange = 4
    end
    self.angle += 1 * math.abs(angleChange)
    self:setRotation(self.angle)
end

--If the gear is in four ranges it adds a point
function Gear:RotationScore()
    if self:getRotation() > 80 and self.canGetPoint and self:getRotation() < 100 then
        incrementGearScore()
        self.canGetPoint = false
    elseif  self:getRotation() > 100 and self:getRotation() < 170 then
        self.canGetPoint = true
    end
    if self:getRotation() > 170 and self.canGetPoint and self:getRotation() < 190 then
        incrementGearScore()
        self.canGetPoint = false
    elseif self:getRotation() > 190 and self:getRotation() < 260 then
        self.canGetPoint = true
    end
    if self:getRotation() > 260 and self.canGetPoint and self:getRotation() < 280 then
        incrementGearScore()
        self.canGetPoint = false
    elseif self:getRotation() > 280 and self:getRotation() < 350 then
        self.canGetPoint = true
    end
    if self:getRotation() > 350 and self.canGetPoint and self:getRotation() < 360 then
        incrementGearScore()
        self.canGetPoint = false
    elseif self:getRotation() > 10 and self:getRotation() < 80 then
        self.canGetPoint = true
    end
end