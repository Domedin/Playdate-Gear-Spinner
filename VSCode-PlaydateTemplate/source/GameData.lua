--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

function LoadGameData()
    gameData = playdate.datastore.read()

    if gameData then
        if gameData.buildingMultipliers then
            buildingMultipliers = gameData.buildingMultipliers
        end
        --[[
        if gameData.upgradesBought then
            local upgradesToDelete = {}
            UpgradesBought = gameData.upgradesBought
            for i,upgradeNum in pairs(Upgrades) do
                --printTable(upgradeNum)
                for j,upgradeBoughtNum in pairs(UpgradesBought) do
                    if upgradeBoughtNum == upgradeNum[6] then
                        --print(upgradeBoughtNum)
                        table.insert(upgradesToDelete, i)
                    end
                end
            end
            for i,upgrade in pairs(upgradesToDelete) do
                print("upgrade to be deleted", upgrade)
                if upgradesToDelete[i-1] ~= nil then
                    table.remove(Upgrades, upgrade)
                else
                    table.remove(Upgrades, upgrade - i)
                end
            end
        end
        ]]
        UpgradesBought = gameData.upgradesBought
    for _, value in pairs(UpgradesBought) do
        -- the value is the id of the upgrade that was bought
        -- the key is arbitrary
        -- consider instead when the player buys an upgrade storing this like 
        -- gameData.upgradesBought[index] = true instead of using table.insert(gameData.upgradesBought, index)
        -- this way you still have some unsorted list of indexes but you can also go
        -- did the player buy upgrade index x? -> if gameData.upgradesBought[x] then
        
        local upgradesToDelete = {}
        for key,upgradeData in pairs(Upgrades) do
            -- item 6 is the index - maybe store these by index too? Then you can just go
            -- Upgrades[value] = nil
            -- ionstead we have to iterate over them all each time.
            if upgradeData[6] == value then
                upgradesToDelete[key] = true
            end
        end
        for key,__ in pairs(upgradesToDelete) do
            Upgrades[key] = nil
        end
        for i = tablelength(Upgrades), 1,-1 do
            if Upgrades[i] == nil then
                table.remove(Upgrades, i)
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

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function saveGameData()
    -- Save game data into a table first
    local gameData = {
        gearNumber = gearNum,
        BuildingsOwned = {Buildings[1][2], Buildings[2][2], Buildings[3][2], Buildings[4][2], Buildings[5][2], Buildings[6][2], Buildings[7][2], Buildings[8][2]},
        buildingsCost = {Buildings[1][3], Buildings[2][3], Buildings[3][3], Buildings[4][3], Buildings[5][3], Buildings[6][3], Buildings[7][3], Buildings[8][3]},
        upgradesBought = UpgradesBought,
        buildingMultipliers = buildingMultipliers,
        prestiegePoints = prestiegePoints,
        totalPrestiegePoints = totalPrestiegePoints
    }
    -- Serialize game data table into the datastore
    playdate.datastore.write(gameData)
end