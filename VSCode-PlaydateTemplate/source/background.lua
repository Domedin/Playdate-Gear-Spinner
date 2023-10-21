local pd <const> = playdate
local gfx <const> = pd.graphics

class('Background').extends(gfx.sprite)

--Creates the background
function Background:init(x, y)
    local backgroundImage = gfx.image.new("images/Background")
    self:setImage(backgroundImage)
    Background.super.init(self, backgroundImage)
    self:moveTo(x, y)
    self:add()
end

class('BackgroundReplace').extends(gfx.sprite)

--Replaces the background behind the buttons
function BackgroundReplace:init(x, y)
    local backgroundReplaceImage = gfx.image.new("images/backgroundReplace")
    self:setImage(backgroundReplaceImage)
    BackgroundReplace.super.init(self, backgroundReplaceImage)
    self:moveTo(x, y)
    self:add()
end