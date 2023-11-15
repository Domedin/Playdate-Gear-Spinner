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

gameData = playdate.datastore.read("SaveData")

if gameData then
    gearNum = gameData.gearNumber
    for i=1, 8 do
        
    end
end

--create gear, score, the backdrop, and creates button text
Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)
CreateButtonText()
InitGridViews()

createUpgrades()
createBuildings()

function saveGameData()
    -- Save game data into a table first
    local gameData = {
        gearNumber = gearNum,
        BuildingsOwned = {Buildings[1][2], Buildings[2][2], Buildings[3][2], Buildings[4][2], Buildings[5][2], Buildings[6][2], Buildings[7][2], Buildings[8][2],}
    }
    -- Serialize game data table into the datastore
    playdate.datastore.write(gameData, "SaveData")
end

function playdate.gameWillTerminate()
    print("saving data")
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