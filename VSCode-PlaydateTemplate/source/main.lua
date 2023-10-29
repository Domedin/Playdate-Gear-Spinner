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

--Create the Gridview
local upgradeGridView = pd.ui.gridview.new(32, 32)

local buildingsGridView = pd.ui.gridview.new(32, 32)

selectedGridView = 0

--Creates the button text sprites
function CreateButtonText()
    upgradeType = gfx.sprite.new()
    upgradeType:setCenter(0,0)
    upgradeType:moveTo(132, 43)
    upgradeType:add()

    upgradeCost = gfx.sprite.new()
    upgradeCost:setCenter(0,0)
    upgradeCost:moveTo(132, 63)
    upgradeCost:add()

    upgradeMultiplier = gfx.sprite.new()
    upgradeMultiplier:setCenter(0,0)
    upgradeMultiplier:moveTo(132, 83)
    upgradeMultiplier:add()

    buildingNumber = gfx.sprite.new()
    buildingNumber:setCenter(0,0)
    buildingNumber:moveTo(132, 43)
    buildingNumber:add()

    buildingCost = gfx.sprite.new()
    buildingCost:setCenter(0,0)
    buildingCost:moveTo(132, 63)
    buildingCost:add()

    buildingGPS = gfx.sprite.new()
    buildingGPS:setCenter(0,0)
    buildingGPS:moveTo(132, 83)
    buildingGPS:add()
end

--Manages the gridview
function InitGridViews()
    upgradeGridView:setNumberOfRows(4)
    upgradeGridView:setNumberOfColumns(4)
    upgradeGridView:setCellPadding(1, 1, 1, 1)

    buildingsGridView:setNumberOfRows(3)
    buildingsGridView:setNumberOfColumns(1)
    buildingsGridView:setCellPadding(1, 1, 1, 1)
end

--create gear, score, the backdrop, and creates button text
Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)
CreateButtonText()
InitGridViews()

--Calls the function to create the upgrades and buildings
UpgradeManager:createUpgrades()
BuildingManager:createUpgrades()

--Draws every cell based on the Upgrades Table
function upgradeGridView:drawCell(section, row, column, selected, x, y, width, height)
    local grid_index = (row - 1) * 4 + column

    if selected and Upgrades[grid_index] ~= nil and selectedGridView == 0 then
        --Draws the selected image
        Upgrades[grid_index][5]:draw(x, y)

        local typeText = Upgrades[grid_index][1] .. " Upgrade"
        local typeTextWidth, typeTextHeight = gfx.getTextSize(typeText)
        local typeTextImage = gfx.image.new(typeTextWidth, typeTextHeight)
        gfx.pushContext(typeTextImage)
            gfx.drawText(typeText, 0, 0)
        gfx.popContext()
        upgradeType:setImage(typeTextImage)

        local costText =  "Cost: " .. Upgrades[grid_index][2]
        local costTextWidth, costTextHeight = gfx.getTextSize(costText)
        local costTextImage = gfx.image.new(costTextWidth, costTextHeight)
        gfx.pushContext(costTextImage)
            gfx.drawText(costText, 0, 0)
        gfx.popContext()
        upgradeCost:setImage(costTextImage)

        local multiplierText =  "Multiplier: " .. Upgrades[grid_index][3] .. "x"
        local multiplierTextWidth, multiplierTextHeight = gfx.getTextSize(multiplierText)
        local multiplierTextImage = gfx.image.new(multiplierTextWidth, multiplierTextHeight)
        gfx.pushContext(multiplierTextImage)
            gfx.drawText(multiplierText, 0, 0)
        gfx.popContext()
        upgradeMultiplier:setImage(multiplierTextImage)

        --if A is pressed and selected and gearNum < cost delete
        if pd.buttonJustPressed(pd.kButtonA) and gearNum >= Upgrades[grid_index][2] then
            gearNum -= Upgrades[grid_index][2]
            table.remove(Upgrades, grid_index)
            UpdateDisplay()
        end
    else
        if Upgrades[grid_index] ~= nil then
            Upgrades[grid_index][4]:draw(x, y)
        end
    end
end

function buildingsGridView:drawCell(section, row, column, selected, x, y, width, height)
    local grid_index = (row - 1) * 1 + column

    if selected and Buildings[grid_index] ~= nil and selectedGridView == 1 then
        --Draws the selected image
        Buildings[grid_index][6]:draw(x, y)

        --Draws the number of buildings owned
        local NumOfBuildingsText = Buildings[grid_index][2] .. " " .. Buildings[grid_index][1] .. "s"
        local typeTextWidth, typeTextHeight = gfx.getTextSize(NumOfBuildingsText)
        local buildingsNumTextImage = gfx.image.new(typeTextWidth, typeTextHeight)
        gfx.pushContext(buildingsNumTextImage)
            gfx.drawText(NumOfBuildingsText, 0, 0)
        gfx.popContext()
        buildingNumber:setImage(buildingsNumTextImage)

        --Draws the cost of the buildings
        local buildingCostText =  "Cost: " .. Buildings[grid_index][3]
        local buildingCostTextWidth, buildingCostTextHeight = gfx.getTextSize(buildingCostText)
        local buildingCostTextImage = gfx.image.new(buildingCostTextWidth, buildingCostTextHeight)
        gfx.pushContext(buildingCostTextImage)
            gfx.drawText(buildingCostText, 0, 0)
        gfx.popContext()
        buildingCost:setImage(buildingCostTextImage)

        --Draws the GPS of the buildings
        local buildingGPSText =  "GPS: " .. Buildings[grid_index][4]
        local buildingGPSTextWidth, buildingGPSTextHeight = gfx.getTextSize(buildingGPSText)
        local buildingGPSTextImage = gfx.image.new(buildingGPSTextWidth, buildingGPSTextHeight)
        gfx.pushContext(buildingGPSTextImage)
            gfx.drawText(buildingGPSText, 0, 0)
        gfx.popContext()
        buildingGPS:setImage(buildingGPSTextImage)

        if pd.buttonJustPressed(pd.kButtonA) and gearNum >= Buildings[grid_index][3] then
            gearNum -= Buildings[grid_index][3]
            Buildings[grid_index][2] += 1
            UpdateDisplay()
        end
    else
        if Buildings[grid_index] ~= nil then
            Buildings[grid_index][5]:draw(x, y)
        end
    end
end

--navigates between all the diffrent upgrade cells
function UpgradeManager:NavigateCells()
    if selectedGridView == 0 then
        local _, selectedRow, _ = upgradeGridView:getSelection()
        local lastRow = upgradeGridView:getNumberOfRowsInSection(1)

        if pd.buttonIsPressed(pd.kButtonUp) then
            upgradeGridView:selectPreviousRow(false)
        elseif pd.buttonIsPressed(pd.kButtonDown) then
            if selectedRow < lastRow then
                upgradeGridView:selectNextRow(false)
            else
                selectedGridView = 1
                upgradeType:setImage(nil)
                upgradeCost:setImage(nil)
                upgradeMultiplier:setImage(nil)
            end
        elseif pd.buttonIsPressed(pd.kButtonLeft) then
            upgradeGridView:selectPreviousColumn(false)
        elseif pd.buttonIsPressed(pd.kButtonRight) then
            upgradeGridView:selectNextColumn(false)
        end
    end
end

function BuildingManager:NavigateCells()
    if selectedGridView == 1 then
        local _, selectedRow, _ = buildingsGridView:getSelection()

        if pd.buttonIsPressed(pd.kButtonUp) then
            if selectedRow == 1 then
                selectedGridView = 0
                buildingNumber:setImage(nil)
                buildingCost:setImage(nil)
                buildingGPS:setImage(nil)
            else
                buildingsGridView:selectPreviousRow(false)
            end
        elseif pd.buttonIsPressed(pd.kButtonDown) then
            buildingsGridView:selectNextRow(false)
        elseif pd.buttonIsPressed(pd.kButtonLeft) then
            buildingsGridView:selectPreviousColumn(false)
        elseif pd.buttonIsPressed(pd.kButtonRight) then
            buildingsGridView:selectNextColumn(false)
        end
    end
end

function pd.update()
    --updates sprites and timers
    gfx.sprite.update()
    pd.timer.updateTimers()

    upgradeGridView:drawInRect(264, 42, 136, 68)
    buildingsGridView:drawInRect(266, 113, 136, 128)

    UpgradeManager:NavigateCells()
    BuildingManager:NavigateCells()

    playdate.drawFPS(0, 0)
end