--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

--Create the Gridview
upgradesGridView = pd.ui.gridview.new(32, 32)

buildingsGridView = pd.ui.gridview.new(32, 32)

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
    upgradesGridView:setNumberOfRows(4)
    upgradesGridView:setNumberOfColumns(4)
    upgradesGridView:setCellPadding(1, 1, 1, 1)

    buildingsGridView:setNumberOfRows(8)
    buildingsGridView:setNumberOfColumns(1)
    buildingsGridView:setCellPadding(1, 1, 1, 1)
end

--Draws every cell based on the Upgrades Table
function upgradesGridView:drawCell(section, row, column, selected, x, y, width, height)
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
            if Upgrades[grid_index][1] == "Gear" then
                table.insert(gearMultipliers, Upgrades[grid_index][3])
            elseif Upgrades[grid_index][1] == "Factory" then
                table.insert(factoryMultipliers, Upgrades[grid_index][3])
            elseif Upgrades[grid_index][1] == "Mine" then
                table.insert(mineMultipliers, Upgrades[grid_index][3])
            elseif Upgrades[grid_index][1] == "Car" then
                table.insert(carMultipliers, Upgrades[grid_index][3])
            elseif Upgrades[grid_index][1] == "Rocket" then
                table.insert(rocketMultipliers, Upgrades[grid_index][3])
            end
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
        Buildings[grid_index][8]:draw(x, y)

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
            UpdateGPS()
            Buildings[grid_index][3] = round(Buildings[grid_index][3] * Buildings[grid_index][6])
            UpdateDisplay()
        end
    else
        if Buildings[grid_index] ~= nil then
            Buildings[grid_index][7]:draw(x, y)
        end
    end
end