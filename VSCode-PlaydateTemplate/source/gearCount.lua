local pd <const> = playdate
local gfx <const> = pd.graphics

class('GearCount').extends(gfx.sprite)

local gearSprite
gearNum = 757

--Creates the gear score
function CreateScoreDisplay()
    gearSprite = gfx.sprite.new()
    UpdateDisplay()
    gearSprite:setCenter(0,0)
    gearSprite:moveTo(140, 4)
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

gearMultipliers = {}

--Adds to the gear score
function incrementGearScore()
    gearNum += 1
    UpdateDisplay()
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function incrementBuildingScore()
    for i,upgradeNum in ipairs(factoryMultipliers) do
        gearNum += Buildings[1][4] * upgradeNum
    end
    for i,upgradeNum in ipairs(mineMultipliers) do
        gearNum += Buildings[2][4] * upgradeNum
    end
    for i,upgradeNum in ipairs(carMultipliers) do
        gearNum += Buildings[3][4] * upgradeNum
    end
    for i,upgradeNum in ipairs(rocketMultipliers) do
        gearNum += Buildings[4][4] * upgradeNum
    end   
    gearNum = round(gearNum, 1)
    UpdateDisplay()
end

local lastSecond = -1
function GearCount:update()
    local currentSecond = math.floor(playdate.getElapsedTime())
    if currentSecond ~= lastSecond then
        incrementBuildingScore()
        lastSecond = currentSecond
    end
end