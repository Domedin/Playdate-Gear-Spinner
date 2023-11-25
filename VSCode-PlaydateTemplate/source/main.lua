-- Corelibs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/utilities/sampler"

-- Game files
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

-- Saves game data when leaving the game
function playdate.gameWillTerminate()
    saveGameData()
end

-- Saves game data when the playdate goes to sleep
function playdate.gameWillSleep()
    saveGameData()
end

function pd.update()
    --updates sprites and timers
    gfx.sprite.update()
    pd.timer.updateTimers()

    --draws all of the Gridview buttons
    upgradesGridView:drawInRect(264, 42, 136, 68)
    buildingsGridView:drawInRect(266, 113, 136, 128)
    prestiegeGridview:drawInRect(366.5, 3.5, 34, 34)

    --only runs cell navigation when the correct grid is selected.
    if selectedGridView == 1 then
        NavigatePrestiegeCell(prestiegeGridview)
    elseif selectedGridView == 2 then
        NavigateUpgradeCells(upgradesGridView)
    elseif selectedGridView == 3 then
        NavigateBuildingCells(buildingsGridView)
    end

    --adds to the gear count each frame.
    GearCount:update()

    --draws FPS for developer
    playdate.drawFPS(0, 0)
end