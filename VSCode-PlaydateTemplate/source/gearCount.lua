local pd <const> = playdate
local gfx <const> = pd.graphics

class('GearCount').extends(gfx.sprite)

local gearSprite
gearNum = 0

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

gearMultipliers = {1}

--Adds to the gear score
function incrementGearScore()
    local gearTotalMultiplication = 1
    for i,upgradeNum in ipairs(gearMultipliers) do
        gearTotalMultiplication *= upgradeNum
    end
    gearNum += 1 * gearTotalMultiplication
    UpdateDisplay()
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function UpdateGPS()
    local buildingOneGPS = Buildings[1][5] * Buildings[1][2]
    local buildingTwoGPS = Buildings[2][5] * Buildings[2][2]
    local buildingThreeGPS = Buildings[3][5] * Buildings[3][2]
    local buildingFourGPS = Buildings[4][5] * Buildings[4][2]
    print("incremental GPS b1", Buildings[1][5])
    for i,upgradeNum in ipairs(factoryMultipliers) do
        buildingOneGPS = buildingOneGPS * upgradeNum
        print("building one gos", buildingOneGPS)
    end
    for i,upgradeNum in ipairs(mineMultipliers) do
        buildingTwoGPS = buildingTwoGPS * upgradeNum
    end
    for i,upgradeNum in ipairs(carMultipliers) do
        buildingThreeGPS = buildingThreeGPS * upgradeNum
    end
    for i,upgradeNum in ipairs(rocketMultipliers) do
        buildingFourGPS = buildingFourGPS * upgradeNum
    end
    Buildings[1][4] = buildingOneGPS
    Buildings[2][4] = buildingTwoGPS
    Buildings[3][4] = buildingThreeGPS
    Buildings[4][4] = buildingFourGPS
end

function incrementBuildingScore()
    UpdateGPS()
    gearNum += (Buildings[1][4] + Buildings[2][4] + Buildings[3][4] + Buildings[4][4])
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