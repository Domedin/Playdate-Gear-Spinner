local pd <const> = playdate
local gfx <const> = pd.graphics

class('Background').extends(gfx.sprite)

--Creates the background
function Background:init(x, y)
    local backgroundImage = gfx.image.new("Images/Misc/Background")
    self:setImage(backgroundImage)
    Background.super.init(self, backgroundImage)
    self:moveTo(x, y)
    self:add()
end