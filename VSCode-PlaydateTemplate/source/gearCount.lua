local pd <const> = playdate
local gfx <const> = pd.graphics

class('GearCount').extends(gfx.sprite)

local gearSprite
gearNum = 100000

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
    local buildingGPS = {Buildings[1][5] * Buildings[1][2], Buildings[2][5] * Buildings[2][2], Buildings[3][5] * Buildings[3][2], Buildings[4][5] * Buildings[4][2], Buildings[5][5] * Buildings[5][2]}
    
    for i,upgradeNum in ipairs(factoryMultipliers) do
        buildingGPS[1] = buildingGPS[1] * upgradeNum
    end
    for i,upgradeNum in ipairs(mineMultipliers) do
        buildingGPS[2] = buildingGPS[2] * upgradeNum
    end
    for i,upgradeNum in ipairs(carMultipliers) do
        buildingGPS[3] = buildingGPS[3] * upgradeNum
    end
    for i,upgradeNum in ipairs(rocketMultipliers) do
        buildingGPS[4] = buildingGPS[4] * upgradeNum
    end
    for i,upgradeNum in ipairs(fifthMultipliers) do
        buildingGPS[5] = buildingGPS[5] * upgradeNum
    end
    for i,buildingNum in ipairs(Buildings) do
        Buildings[i][4] = buildingGPS[i]
    end
end

function incrementBuildingScore()
    UpdateGPS() 
    --gearNum += (Buildings[1][4] + Buildings[2][4] + Buildings[3][4] + Buildings[4][4] + Buildings[5][4])
    for i,buildingNum in ipairs(Buildings) do 
        gearNum += buildingNum[4]
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