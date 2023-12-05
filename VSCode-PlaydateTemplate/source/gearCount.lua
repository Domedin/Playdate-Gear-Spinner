local pd <const> = playdate
local gfx <const> = pd.graphics

class('GearCount').extends(gfx.sprite)

--Creates a variable for every third power
gearNum = 0
gearNumThousands = 0
gearNumMillions = 0
gearNumBillions = 0
gearNumTrillions = 0

function ManageBaseThreeNums()
    while gearNum >= 1000 do
        gearNumThousands += 1
        gearNum -= 1000
    end
    while gearNumThousands >= 1000 do
        gearNumMillions += 1
        gearNumThousands -= 1000
    end
    while gearNumMillions >= 1000 do
        gearNumBillions += 1
        gearNumMillions -= 1000
    end
    while gearNumBillions >= 1000 do
        gearNumTrillions += 1
        gearNumBillions -= 1000
    end
end

function FindDisplayValues()
    ManageBaseThreeNums()
    if gearNumTrillions ~= 0 then
        return gearNumTrillions, " Trillions"
    elseif gearNumBillions ~= 0 then
        return gearNumBillions, " Billions"
    elseif gearNumMillions ~= 0 then
        return gearNumMillions, " Millions"
    elseif gearNumThousands ~= 0 then
        return gearNumThousands, " Thousands"
    else
        return gearNum, ""
    end
end

--Creates the gear score
function CreateScoreDisplay()
    gearCountSprite = gfx.sprite.new()
    gearCountSprite:setCenter(0,0)
    gearCountSprite:moveTo(140, 2)
    gearCountSprite:add()

    GPSSprite = gfx.sprite.new()
    GPSSprite:setCenter(0,0)
    GPSSprite:moveTo(139, 20)
    GPSSprite:add()
    UpdateDisplay()
end

--Updates the display
function UpdateDisplay()
    --local gearNumber, baseThree = FindDisplayValues()
    local gearText = "Gears: " .. gearNum
    local gearTextWidth, gearTextHeight = gfx.getTextSize(gearText)
    local gearImage = gfx.image.new(gearTextWidth, gearTextHeight)
    gfx.pushContext(gearImage)
        gfx.drawText(gearText, 0, 0)
    gfx.popContext()
    gearCountSprite:setImage(gearImage)

    local totalGPS = 0
    for i,buildingNum in ipairs(Buildings) do
        totalGPS += buildingNum.TOTALGPS
    end
    local GPSText = "Total GPS: " .. totalGPS
    local GPSTextWidth, GPSTextHeight = gfx.getTextSize(GPSText)
    local GPSImage = gfx.image.new(GPSTextWidth, GPSTextHeight)
    gfx.pushContext(GPSImage)
        gfx.drawText(GPSText, 0, 0)
    gfx.popContext()
    GPSSprite:setImage(GPSImage)
end

gearMultipliers = {1}

--Adds to the gear score
function incrementGearScore()
    local gearTotalMultiplication = 1
    for i,upgradeNum in pairs(gearMultipliers) do
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
        Buildings[i].TOTALGPS = buildingGPS[i] * (1 + (totalPrestiegePoints * 0.01))
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