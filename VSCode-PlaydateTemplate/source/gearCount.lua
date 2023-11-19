local pd <const> = playdate
local gfx <const> = pd.graphics

class('GearCount').extends(gfx.sprite)

local gearCountSprite
local GPSSprite

gameData = playdate.datastore.read()

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
    local buildingGPS = {Buildings[1][5] * Buildings[1][2], Buildings[2][5] * Buildings[2][2], Buildings[3][5] * Buildings[3][2], Buildings[4][5] * Buildings[4][2], Buildings[5][5] * Buildings[5][2], Buildings[6][5] * Buildings[6][2], Buildings[7][5] * Buildings[7][2], Buildings[8][5] * Buildings[8][2]}

    for i,upgradeType in pairs(buildingMultipliers) do
        for j,upgradeNum in pairs(upgradeType) do
            buildingGPS[i] = buildingGPS[i] * upgradeNum
        end
    end
    for i,buildingNum in ipairs(Buildings) do
        Buildings[i][4] = buildingGPS[i]
    end
end

function incrementBuildingScore()
    UpdateGPS() 
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