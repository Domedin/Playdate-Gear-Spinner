local pd <const> = playdate
local gfx <const> = pd.graphics

class('GearCount').extends(gfx.sprite)

gearNum = 0

--Creates the gear score
function CreateScoreDisplay()
    gearCountSprite = gfx.sprite.new()
    UpdateDisplay()
    gearCountSprite:setCenter(0,0)
    gearCountSprite:moveTo(140, 4)
    gearCountSprite:add()

    GPSSprite = gfx.sprite.new()
    UpdateDisplay()
    GPSSprite:setCenter(0,0)
    GPSSprite:moveTo(200, 4)
    GPSSprite:add()
end

--Updates the display
function UpdateDisplay()
    local gearText = "Gears: " .. gearNum
    local textWidth, textHeight = gfx.getTextSize(gearText)
    local gearImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(gearImage)
        gfx.drawText(gearText, 0, 0)
    gfx.popContext()
    gearCountSprite:setImage(gearImage)
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
    --adds the total GPS of each building to one big GPS 
    local buildingGPS = {}
    for i,GPSNum in pairs(Buildings) do
        table.insert(buildingGPS, Buildings[i].INCREMENTALGPS * Buildings[i].AMOUNT)
    end
    --multiplies each GPS by the multiplier
    for i,multiplierType in pairs(buildingMultipliers) do
        for j,multiplierNum in pairs(multiplierType) do
            buildingGPS[i] *= multiplierNum
        end
    end
    for i,buildingNum in ipairs(Buildings) do
        Buildings[i].TOTALGPS = buildingGPS[i]
    end
end

function incrementBuildingScore()
    UpdateGPS()
    --adds the total GPS of each building to the gearNum
    for i,buildingNum in ipairs(Buildings) do
        gearNum += buildingNum.TOTALGPS
    end
    gearNum = round(gearNum, 1)
    UpdateDisplay()
end

local lastSecond = -1
--adds the building GPS to the gearNum on a timer
function GearCount:update()
    local currentSecond = math.floor(playdate.getElapsedTime())
    if currentSecond ~= lastSecond then
        incrementBuildingScore()
        lastSecond = currentSecond
    end
end