local pd <const> = playdate
local gfx <const> = pd.graphics

class('Background').extends(gfx.sprite)

function Background:init(x, y)
    local backgroundImage = gfx.image.new("images/Background")
    self:setImage(backgroundImage)
    Background.super.init(self, backgroundImage)
    self:moveTo(x, y)
    self:add()
end