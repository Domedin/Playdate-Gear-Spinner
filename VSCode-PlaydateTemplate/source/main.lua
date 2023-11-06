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

--create gear, score, the backdrop, and creates button text
Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)
CreateButtonText()
InitGridViews()

--Calls the function to create the upgrades and buildings
createUpgrades()
createBuildings()

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