local pd <const> = playdate
local gfx <const> = pd.graphics

class('GearCount').extends(gfx.sprite)

--Creates a variable for every third power
GearCountNums = {ONES = 0, THOUSANDS = 0, MILLIONS = 0, BILLIONS = 0, TRILLIONS = 0}
GearBaseMultipliers = {1, 1000, 1000000, 1000000000, 1000000000}

function ManageBaseThreeNums()
    while GearCountNums.ONES >= 1000 do
        GearCountNums.THOUSANDS += 1
        GearCountNums.ONES -= 1000
    end
    while GearCountNums.THOUSANDS >= 1000 do
        GearCountNums.MILLIONS += 1
        GearCountNums.THOUSANDS -= 1000
    end
    while GearCountNums.MILLIONS >= 1000 do
        GearCountNums.BILLIONS += 1
        GearCountNums.MILLIONS -= 1000
    end
    while GearCountNums.BILLIONS >= 1000 do
        GearCountNums.TRILLIONS += 1
        GearCountNums.BILLIONS -= 1000
    end
end

function FindDisplayValues()
    ManageBaseThreeNums()
    if GearCountNums.TRILLIONS ~= 0 then
        local numOfZeros = 3 - string.len(tostring(gearNumBillions))
        if numOfZeros == 3 then
            return GearCountNums.TRILLIONS, " Trillions", numOfZeros, GearCountNums.BILLIONS, ""
        else
            return GearCountNums.TRILLIONS, " Trillions", numOfZeros, GearCountNums.BILLIONS, "."
        end
    elseif GearCountNums.BILLIONS ~= 0 then
        local numOfZeros = 3 - string.len(tostring(GearCountNums.MILLIONS))
        if numOfZeros == 3 then
            return GearCountNums.BILLIONS, " Billions", numOfZeros, GearCountNums.MILLIONS, ""
        else
            return GearCountNums.BILLIONS, " Billions", numOfZeros, GearCountNums.MILLIONS, "."
        end
    elseif GearCountNums.MILLIONS ~= 0 then
        local numOfZeros = 3 - string.len(tostring(GearCountNums.THOUSANDS))
        if numOfZeros == 3 then
            return GearCountNums.MILLIONS, " Millions", numOfZeros, GearCountNums.THOUSANDS, ""
        else
            return GearCountNums.MILLIONS, " Millions", numOfZeros, GearCountNums.THOUSANDS, "."
        end
    elseif GearCountNums.THOUSANDS ~= 0 then
        local numOfZeros = 3 - string.len(tostring(GearCountNums.ONES))
        if numOfZeros == 3 then
            return GearCountNums.THOUSANDS, " Thousands", numOfZeros, GearCountNums.ONES, ""
        else
            return GearCountNums.THOUSANDS, " Thousands", numOfZeros, GearCountNums.ONES, "."
        end
    else
        return GearCountNums.ONES, "", "", "", ""
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
    local gearNumber, baseThree, numOfZeros, decimalValue, decimal = FindDisplayValues()
    local gearText = "Gears: " .. gearNumber .. numOfZeros .. decimal .. decimalValue .. baseThree
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
    GearCountNums.ONES += 1 * gearTotalMultiplication
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
        GearCountNums.ONES += buildingNum.TOTALGPS
    end
    GearCountNums.ONES = round(GearCountNums.ONES, 1)
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