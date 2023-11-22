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
import "GameData"
import "prestiege"

--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

-- CreateUpgrades and createBuildings
createUpgrades()
createBuildings()

--load game data
LoadGameData()

--Create gear, score, the backdrop, and creates button text
Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)
CreateButtonText()
InitGridViews()

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
    prestiegeGridview:drawInRect(366.5, 3.5, 34, 34)

    if selectedGridView == 1 then
        NavigatePrestiegeCells(prestiegeGridview)
    elseif selectedGridView == 2 then
        NavigateUpgradeCells(upgradesGridView)
    elseif selectedGridView == 3 then
        NavigateBuildingCells(buildingsGridView)
    end

    GearCount:update()
    playdate.drawFPS(0, 0)
end