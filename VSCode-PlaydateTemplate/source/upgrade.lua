local pd <const> = playdate
local gfx <const> = pd.graphics

class('upgrade').extends(gfx.sprite)

function upgrade:init(x, y)
    local upgradeImage = gfx.image.new("Images/upgradeIcon.png")
    local CannotAffordUpgradeImage = gfx.image.new("Images/CannotAffordIcon.png")
    self:setImage(upgradeImage)
    upgrade.super.init(self, upgradeImage)
    self:moveTo(x, y)
    self:add()
    self.upgradeNum = 1
end

function upgrade:update()
    if pd.buttonJustPressed(pd.kButtonA) then
        self.upgradeNum += 1
    end
end