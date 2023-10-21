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
    self.rotation = 0
    self.x = x
    self.y = y
    self.angle = 0
    self.canGetPoint = true
end

function Gear:update()
    self:Rotation()
end

--Spins the gear based on how quickly the crank is spun
function Gear:Rotation()
    self:setRotation(self.angle)
    angleChange, angleAcceleratedChange = playdate.getCrankChange()
    angleChange = math.abs(angleChange / 4)
    if angleChange > 4 then
        angleChange = 4
    end
    self.angle += 1 * math.abs(angleChange)
    
    if self:getRotation() > 356 then
        self.canGetPoint = true
    elseif self:getRotation() < 10 and self.canGetPoint then
        incrementScore()
        self.canGetPoint = false
    end
end