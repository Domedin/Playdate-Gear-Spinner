--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

function LoadGameData()
    gameData = playdate.datastore.read()

    if gameData then
        if gameData.buildingMultipliers then
            buildingMultipliers = gameData.buildingMultipliers
        end
        if gameData.buildingsBought then
            UpgradesBought = gameData.buildingsBought
            for i,upgradeNum in pairs(Upgrades) do
                for j,upgradeBoughtNum in pairs(UpgradesBought) do
                    if upgradeNum[6] == upgradeBoughtNum then
                        table.remove(Upgrades, i)
                    end
                end
            end
        end
        if gameData.gearNumber then
            gearNum = gameData.gearNumber
        end
        if gameData.BuildingsOwned and gameData.buildingsCost then
            for i=1, 8 do
                Buildings[i][2] = gameData.BuildingsOwned[i]
                Buildings[i][3] = gameData.buildingsCost[i]
            end
        end
        if gameData.prestiegePoints and gameData.totalPrestiegePoints then
            prestiegePoints = gameData.prestiegePoints
            totalPrestiegePoints = gameData.totalPrestiegePoints
        end
    end
end

function saveGameData()
    -- Save game data into a table first
    local gameData = {
        gearNumber = gearNum,
        BuildingsOwned = {Buildings[1][2], Buildings[2][2], Buildings[3][2], Buildings[4][2], Buildings[5][2], Buildings[6][2], Buildings[7][2], Buildings[8][2]},
        buildingsCost = {Buildings[1][3], Buildings[2][3], Buildings[3][3], Buildings[4][3], Buildings[5][3], Buildings[6][3], Buildings[7][3], Buildings[8][3]},
        buildingsBought = UpgradesBought,
        buildingMultipliers = buildingMultipliers,
        prestiegePoints = prestiegePoints,
        totalPrestiegePoints = totalPrestiegePoints
    }
    -- Serialize game data table into the datastore
    playdate.datastore.write(gameData)
end