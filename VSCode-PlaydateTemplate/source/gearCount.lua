local pd <const> = playdate
local gfx <const> = pd.graphics

local gearSprite
gearNum = 757

--Creates the gear score
function CreateScoreDisplay()
    gearSprite = gfx.sprite.new()
    UpdateDisplay()
    gearSprite:setCenter(0,0)
    gearSprite:moveTo(310, 4)
    gearSprite:add()
end

--Updates the display
function UpdateDisplay()
    local gearText = "Gears: " .. gearNum
    local textWidth, textHeight = gfx.getTextSize(gearText)
    local gearImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(gearImage)
        gfx.drawText(gearText, 0, 0)
    gfx.popContext()
    gearSprite:setImage(gearImage)
end

--Adds to the gear score
function incrementScore()
    gearNum += 3
    UpdateDisplay()
end