--Shortcuts
local pd <const> = playdate
local gfx <const> = playdate.graphics

--Create the Gridview
upgradesGridView = pd.ui.gridview.new(32, 32)

buildingsGridView = pd.ui.gridview.new(32, 32)

prestiegeGridview = pd.ui.gridview.new(32, 32)

selectedGridView = 2

UpgradesBought = {}

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

    PrestiegePointsSprite = gfx.sprite.new()
    PrestiegePointsSprite:setCenter(0,0)
    PrestiegePointsSprite:moveTo(132, 43)
    PrestiegePointsSprite:add()

    totalPrestiegePointsSprite = gfx.sprite.new()
    totalPrestiegePointsSprite:setCenter(0,0)
    totalPrestiegePointsSprite:moveTo(132, 63)
    totalPrestiegePointsSprite:add()
end

--Manages the gridview
function InitGridViews()
    upgradesGridView:setNumberOfRows(4)
    upgradesGridView:setNumberOfColumns(4)
    upgradesGridView:setCellPadding(1, 1, 1, 1)

    buildingsGridView:setNumberOfRows(8)
    buildingsGridView:setNumberOfColumns(1)
    buildingsGridView:setCellPadding(1, 1, 1, 1)

    prestiegeGridview:setNumberOfRows(1)
    prestiegeGridview:setNumberOfColumns(2)
    prestiegeGridview:setCellPadding(1, 1, 1, 1)
end

function prestiegeGridview:drawCell(section, row, column, selected, x, y, width, height)
    if selectedGridView == 1 and selected then
        selectedPrestiegeImage:draw(x, y)
        local prestiegePointsText = prestiegePoints .. " Points"
        local prestiegePointsTextWidth, prestiegePointsTextHeight = gfx.getTextSize(prestiegePointsText)
        local prestiegePointsTextImage = gfx.image.new(prestiegePointsTextWidth, prestiegePointsTextHeight)
        gfx.pushContext(prestiegePointsTextImage)
            gfx.drawText(prestiegePointsText, 0, 0)
        gfx.popContext()
        PrestiegePointsSprite:setImage(prestiegePointsTextImage)

        local totalPrestiegePointsText = totalPrestiegePoints .. " Total Points"
        local totalPrestiegePointsTextWidth, totalPrestiegePointsTextHeight = gfx.getTextSize(totalPrestiegePointsText)
        local totalPrestiegePointsTextImage = gfx.image.new(totalPrestiegePointsTextWidth, totalPrestiegePointsTextHeight)
        gfx.pushContext(totalPrestiegePointsTextImage)
            gfx.drawText(totalPrestiegePointsText, 0, 0)
        gfx.popContext()
        totalPrestiegePointsSprite:setImage(totalPrestiegePointsTextImage)

        if pd.buttonJustPressed(pd.kButtonA) then
            Prestiege()
        end
    else
        prestiegeImage:draw(x, y)
    end
end

--Draws every cell based on the Upgrades Table
function upgradesGridView:drawCell(section, row, column, selected, x, y, width, height)
    local grid_index = (row - 1) * 4 + column

    if selected and Upgrades[grid_index] ~= nil and selectedGridView == 2 then
        --Draws the selected image
        Upgrades[grid_index].SELECTEDIMAGE:draw(x, y)

        local typeText = Upgrades[grid_index].TYPE .. " Upgrade"
        local typeTextWidth, typeTextHeight = gfx.getTextSize(typeText)
        local typeTextImage = gfx.image.new(typeTextWidth, typeTextHeight)
        gfx.pushContext(typeTextImage)
            gfx.drawText(typeText, 0, 0)
        gfx.popContext()
        upgradeType:setImage(typeTextImage)

        local costText =  "Cost: " .. Upgrades[grid_index].COST .. " " .. UpgradeBaseNames[Upgrades[grid_index].GEARBASE]
        local costTextWidth, costTextHeight = gfx.getTextSize(costText)
        local costTextImage = gfx.image.new(costTextWidth, costTextHeight)
        gfx.pushContext(costTextImage)
            gfx.drawText(costText, 0, 0)
        gfx.popContext()
        upgradeCost:setImage(costTextImage)

        local multiplierText =  "Multiplier: " .. Upgrades[grid_index].MULTIPLIER .. "x"
        local multiplierTextWidth, multiplierTextHeight = gfx.getTextSize(multiplierText)
        local multiplierTextImage = gfx.image.new(multiplierTextWidth, multiplierTextHeight)
        gfx.pushContext(multiplierTextImage)
            gfx.drawText(multiplierText, 0, 0)
        gfx.popContext()
        upgradeMultiplier:setImage(multiplierTextImage)

        --if A is pressed and selected and gearNum < cost delete
        if pd.buttonJustPressed(pd.kButtonA) and gearNum >= Upgrades[grid_index].COST then --This line needs to be changed to factor gear cost
            gearNum -= Upgrades[grid_index].COST
            if Upgrades[grid_index].TYPE == "Gear" then
                table.insert(gearMultipliers, Upgrades[grid_index].MULTIPLIER)
                table.insert(UpgradesBought, Upgrades[grid_index].NUM)
            else
                table.insert(buildingMultipliers[Upgrades[grid_index].TYPE], Upgrades[grid_index].MULTIPLIER)
                table.insert(UpgradesBought, Upgrades[grid_index].NUM)
            end
            table.remove(Upgrades, grid_index)
            UpdateDisplay()
        end
    else
        if Upgrades[grid_index] ~= nil then
            Upgrades[grid_index].IMAGE:draw(x, y)
        end
    end
end

function buildingsGridView:drawCell(section, row, column, selected, x, y, width, height)
    local grid_index = (row - 1) * 1 + column

    if selected and Buildings[grid_index] ~= nil and selectedGridView == 3 then
        --Draws the selected image
        Buildings[grid_index].SELECTEDIMAGE:draw(x, y)

        --Draws the number of buildings owned
        local NumOfBuildingsText = Buildings[grid_index].AMOUNT .. " " .. Buildings[grid_index].NAME .. "s"
        local typeTextWidth, typeTextHeight = gfx.getTextSize(NumOfBuildingsText)
        local buildingsNumTextImage = gfx.image.new(typeTextWidth, typeTextHeight)
        gfx.pushContext(buildingsNumTextImage)
            gfx.drawText(NumOfBuildingsText, 0, 0)
        gfx.popContext()
        buildingNumber:setImage(buildingsNumTextImage)

        --Draws the cost of the buildings
        local buildingCostText =  "Cost: " .. Buildings[grid_index].COST
        local buildingCostTextWidth, buildingCostTextHeight = gfx.getTextSize(buildingCostText)
        local buildingCostTextImage = gfx.image.new(buildingCostTextWidth, buildingCostTextHeight)
        gfx.pushContext(buildingCostTextImage)
            gfx.drawText(buildingCostText, 0, 0)
        gfx.popContext()
        buildingCost:setImage(buildingCostTextImage)

        --Draws the GPS of the buildings
        local buildingGPSText =  "GPS: " .. Buildings[grid_index].TOTALGPS
        local buildingGPSTextWidth, buildingGPSTextHeight = gfx.getTextSize(buildingGPSText)
        local buildingGPSTextImage = gfx.image.new(buildingGPSTextWidth, buildingGPSTextHeight)
        gfx.pushContext(buildingGPSTextImage)
            gfx.drawText(buildingGPSText, 0, 0)
        gfx.popContext()
        buildingGPS:setImage(buildingGPSTextImage)

        if pd.buttonJustPressed(pd.kButtonA) and gearNum >= Buildings[grid_index].COST then
            gearNum -= Buildings[grid_index].COST
            Buildings[grid_index].AMOUNT += 1
            UpdateGPS()
            Buildings[grid_index].COST = round(Buildings[grid_index].COST * Buildings[grid_index].INCREMENTALCOST)
            UpdateDisplay()
        end
    else
        if Buildings[grid_index] ~= nil then
            Buildings[grid_index].IMAGE:draw(x, y)
        end
    end
end