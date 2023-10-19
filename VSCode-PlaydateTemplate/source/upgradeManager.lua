local pd <const> = playdate
local gfx <const> = pd.graphics

class('Upgrade').extends(gfx.sprite)

function Upgrade:init(row, column, type, cost, multiplier, pressed, imagepath)
    self.row = row
    self.column = column
    self.multiplier = multiplier
    self.pressed = pressed
    self.type = type
    self.image = gfx.image.new(imagepath)
    self.cost = cost

    --self:setImage(self.image)
    --self:moveTo(row, column)
    --self:add()
end

class('UpgradeManager').extends(gfx.sprite)

local upgrades = {}

function UpgradeManager:createUpgrade(row, column, type, cost, multiplier, pressed, imagepath)
    
    local upgrade = Upgrade(row, column, type, cost, multiplier, pressed, imagepath)
    table.insert(upgrades, upgrade)
end