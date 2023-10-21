-- Corelibs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"

-- Game
import "gear"
import "gearCount"
import "background"
import "buildingManager"
import "upgradeManager"

--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

--create gear, score, and the backdrop
Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)

--Create the Gridview
local upgradeGridView = pd.ui.gridview.new(32, 32)

--navigates between all the diffrent upgrade cells
function NavigateCells()
    if pd.buttonIsPressed(pd.kButtonUp) then
        upgradeGridView:selectPreviousRow(false)
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        upgradeGridView:selectNextRow(false)
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        upgradeGridView:selectPreviousColumn(false)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        upgradeGridView:selectNextColumn(false)
    end
end

--Calls the function to create the upgrades
UpgradeManager:createUpgrades()

--Draws every cell based on the Upgrades Table
function upgradeGridView:drawCell(section, row, column, selected, x, y, width, height)
    local grid_index = (row - 1) * 4 + column

    if selected then
        Upgrades[grid_index][6]:draw(x, y)

        BackgroundReplace(197, 142)

        gearInfo = gfx.sprite.new()
        gearInfo:setCenter(0,0)
        gearInfo:moveTo(132, 43)
        gearInfo:add()

        local Text = Upgrades[grid_index][2] .. " Upgrade"
        local textWidth, textHeight = gfx.getTextSize(Text)
        local TextImage = gfx.image.new(textWidth, textHeight)
        gfx.pushContext(TextImage)
            gfx.drawText(Text, 0, 0)
        gfx.popContext()
        gearInfo:setImage(TextImage)
    else
        Upgrades[grid_index][5]:draw(x, y)
    end
end

function pd.update()
    --updates sprites and timers
    gfx.sprite.update()
    pd.timer.updateTimers()

    --Manages the gridview
    upgradeGridView:setNumberOfRows(4)
    upgradeGridView:setNumberOfColumns(4)
    upgradeGridView:setCellPadding(1, 1, 1, 1)
    NavigateCells()
    upgradeGridView:drawInRect(264, 42, 136, 68)
end