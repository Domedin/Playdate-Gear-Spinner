--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

function LoadGameData()
    gameData = playdate.datastore.read()

    if gameData then
        if gameData.buildingMultipliers then
            buildingMultipliers = gameData.buildingMultipliers
        end

        if gameData.upgradesBought then
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
                    if upgradeData.NUM == value then
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
        end
        if gameData.gearNumber then
            gearNum = gameData.gearNumber
        end
        if gameData.BuildingsOwned and gameData.buildingsCost then
            for i=1, 8 do
                Buildings[i].AMOUNT = gameData.BuildingsOwned[i] --2
                Buildings[i].COST = gameData.buildingsCost[i] --3
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
        BuildingsOwned = {Buildings[1].AMOUNT, Buildings[2].AMOUNT, Buildings[3].AMOUNT, Buildings[4].AMOUNT, Buildings[5].AMOUNT, Buildings[6].AMOUNT, Buildings[7].AMOUNT, Buildings[8].AMOUNT},
        buildingsCost = {Buildings[1].COST, Buildings[2].COST, Buildings[3].COST, Buildings[4].COST, Buildings[5].COST, Buildings[6].COST, Buildings[7].COST, Buildings[8].COST},
        upgradesBought = UpgradesBought,
        buildingMultipliers = buildingMultipliers,
        prestiegePoints = prestiegePoints,
        totalPrestiegePoints = totalPrestiegePoints
    }
    -- Serialize game data table into the datastore
    playdate.datastore.write(gameData)
end