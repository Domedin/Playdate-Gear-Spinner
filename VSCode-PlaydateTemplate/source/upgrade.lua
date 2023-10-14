local pd <const> = playdate
local gfx <const> = pd.graphics

class('Upgrade').extends(gfx.sprite)

function Upgrade:init(x, y)
    local upgradeImage = gfx.image.new("Images/upgradeIcon.png")
    local CannotAffordUpgradeImage = gfx.image.new("Images/CannotAffordIcon.png")
    self:setImage(upgradeImage)
    Upgrade.super.init(self, upgradeImage)
    self:moveTo(x, y)
    self:add()
    self.upgradeNum = 1
end

function Upgrade:update()
    if pd.buttonJustPressed(pd.kButtonA) then
        self.upgradeNum += 1
    end
end