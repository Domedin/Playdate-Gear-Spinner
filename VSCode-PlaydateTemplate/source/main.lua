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

    if selected and Upgrades[grid_index] ~= nil then
        --Draws the selected image
        Upgrades[grid_index][6]:draw(x, y)

        --Replaces the background behind the buttons
        BackgroundReplace(197, 142)

        --Type Text
        upgradeType = gfx.sprite.new()
        upgradeType:setCenter(0,0)
        upgradeType:moveTo(132, 43)
        upgradeType:add()

        local typeText = Upgrades[grid_index][2] .. " Upgrade"
        local typeTextWidth, typeTextHeight = gfx.getTextSize(typeText)
        local typeTextImage = gfx.image.new(typeTextWidth, typeTextHeight)
        gfx.pushContext(typeTextImage)
            gfx.drawText(typeText, 0, 0)
        gfx.popContext()
        upgradeType:setImage(typeTextImage)

        --Cost Text
        upgradeCost = gfx.sprite.new()
        upgradeCost:setCenter(0,0)
        upgradeCost:moveTo(132, 63)
        upgradeCost:add()

        local costText =  "Cost: " .. Upgrades[grid_index][3]
        local costTextWidth, costTextHeight = gfx.getTextSize(costText)
        local costTextImage = gfx.image.new(costTextWidth, costTextHeight)
        gfx.pushContext(costTextImage)
            gfx.drawText(costText, 0, 0)
        gfx.popContext()
        upgradeCost:setImage(costTextImage)

        --Multiplier Text
        upgradeMultiplier = gfx.sprite.new()
        upgradeMultiplier:setCenter(0,0)
        upgradeMultiplier:moveTo(132, 83)
        upgradeMultiplier:add()

        local multiplierText =  "Multiplier: " .. Upgrades[grid_index][4] .. "x"
        local multiplierTextWidth, multiplierTextHeight = gfx.getTextSize(multiplierText)
        local multiplierTextImage = gfx.image.new(multiplierTextWidth, multiplierTextHeight)
        gfx.pushContext(multiplierTextImage)
            gfx.drawText(multiplierText, 0, 0)
        gfx.popContext()
        upgradeMultiplier:setImage(multiplierTextImage)

        --if A is pressed and selected and gearNum < cost delete
        if pd.buttonJustPressed(pd.kButtonA) and gearNum > Upgrades[grid_index][3] then
            print("bought", Upgrades[grid_index][2])
            gearNum -= Upgrades[grid_index][3]
            table.remove(Upgrades, grid_index)
            UpdateDisplay()
        end
    else
        if Upgrades[grid_index] ~= nil then
            Upgrades[grid_index][5]:draw(x, y)
        end
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
    sample("draw In Rect", function()
        upgradeGridView:drawInRect(264, 42, 136, 68)
    end)

    playdate.drawFPS(0, 0)
end