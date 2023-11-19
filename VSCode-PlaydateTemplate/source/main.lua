-- Corelibs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/utilities/sampler"

-- Game
import "gear"
import "gearCount"
import "background"
import "buildingManager"
import "upgradeManager"
import "gridview"

--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

-- CreateUpgrades and createBuildings
createUpgrades()
createBuildings()

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
end

--Create gear, score, the backdrop, and creates button text
Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)
CreateButtonText()
InitGridViews()

function saveGameData()
    -- Save game data into a table first
    local gameData = {
        gearNumber = gearNum,
        BuildingsOwned = {Buildings[1][2], Buildings[2][2], Buildings[3][2], Buildings[4][2], Buildings[5][2], Buildings[6][2], Buildings[7][2], Buildings[8][2]},
        buildingsCost = {Buildings[1][3], Buildings[2][3], Buildings[3][3], Buildings[4][3], Buildings[5][3], Buildings[6][3], Buildings[7][3], Buildings[8][3]},
        buildingsBought = UpgradesBought,
        buildingMultipliers = buildingMultipliers
    }
    -- Serialize game data table into the datastore
    playdate.datastore.write(gameData)
end

-- Saves game data when leaving the game or the playdate shuts itself off
function playdate.gameWillTerminate()
    saveGameData()
end

function playdate.gameWillSleep()
    saveGameData()
end

function pd.update()
    --updates sprites and timers
    gfx.sprite.update()
    pd.timer.updateTimers()

    upgradesGridView:drawInRect(264, 42, 136, 68)
    buildingsGridView:drawInRect(266, 113, 136, 128)

    if selectedGridView == 0 then
        NavigateUpgradeCells(upgradesGridView)
    elseif selectedGridView == 1 then
        NavigateBuildingCells(buildingsGridView)
    end

    GearCount:update()
    playdate.drawFPS(0, 0)
end