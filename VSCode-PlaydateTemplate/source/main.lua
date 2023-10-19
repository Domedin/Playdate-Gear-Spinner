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

local pd <const> = playdate
local gfx <const> = playdate.graphics

Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)

local upgradeGridView = pd.ui.gridview.new(32, 32)

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

local gearImage = gfx.image.new("images/upgradeIcon")
local selectedGearImage = gfx.image.new("images/SelectedGearIcon")

local factoryImage = gfx.image.new("images/FactoryIcon")
local selectedFactoryImage = gfx.image.new("images/selectedFactoryIcon")

local carImage = gfx.image.new("images/upgradeIcons/carUpgradeIcon")
local selectedCarImage = gfx.image.new("images/upgradeIcons/selectedCarIcon")

local rocketImage = gfx.image.new("images/upgradeIcons/rocketUpgradeIcon")
local selectedRocketImage = gfx.image.new("images/upgradeIcons/selectedRocketIcon")

function upgradeGridView:drawCell(section, row, column, selected, x, y, width, height)
    if column == 1 then
        if selected then
            selectedGearImage:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local gearText = "Gear Upgrade"
            local textWidth, textHeight = gfx.getTextSize(gearText)
            local gearTextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(gearTextImage)
                gfx.drawText(gearText, 0, 0)
            gfx.popContext()
            gearInfo:setImage(gearTextImage)
            print("gear")
        else
            gearImage:draw(x, y)
        end
    elseif column == 2 then
        if selected then
            selectedFactoryImage:draw(x, y)

            BackgroundReplace(197, 142)

            factoryInfo = gfx.sprite.new()
            factoryInfo:setCenter(0,0)
            factoryInfo:moveTo(132, 43)
            factoryInfo:add()

            local factoryText = "Factory Upgrade"
            local textWidth, textHeight = gfx.getTextSize(factoryText)
            local factoryTextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(factoryTextImage)
                gfx.drawText(factoryText, 0, 0)
            gfx.popContext()
            factoryInfo:setImage(factoryTextImage)
            print("factory")
        else
            factoryImage:draw(x, y)
        end
    elseif column == 3 then
        if selected then
            selectedCarImage:draw(x, y)

            BackgroundReplace(197, 142)

            CarInfo = gfx.sprite.new()
            CarInfo:setCenter(0,0)
            CarInfo:moveTo(132, 43)
            CarInfo:add()

            local CarText = "Car Upgrade"
            local textWidth, textHeight = gfx.getTextSize(CarText)
            local CarTextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(CarTextImage)
                gfx.drawText(CarText, 0, 0)
            gfx.popContext()
            CarInfo:setImage(CarTextImage)
            print("car")
        else
            carImage:draw(x, y)
        end
    elseif column == 4 then
        if selected then
            selectedRocketImage:draw(x, y)

            BackgroundReplace(197, 142)

            RocketInfo = gfx.sprite.new()
            RocketInfo:setCenter(0,0)
            RocketInfo:moveTo(132, 43)
            RocketInfo:add()

            local RocketText = "Rocket Upgrade"
            local textWidth, textHeight = gfx.getTextSize(RocketText)
            local RocketTextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(RocketTextImage)
                gfx.drawText(RocketText, 0, 0)
            gfx.popContext()
            RocketInfo:setImage(RocketTextImage)
            print("rocket")
        else
            rocketImage:draw(x, y)
        end
    end
end

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()

    upgradeGridView:setNumberOfRows(16)
    upgradeGridView:setNumberOfColumns(4)
    upgradeGridView:setCellPadding(1, 1, 1, 1)
    NavigateCells()
    upgradeGridView:drawInRect(264, 42, 136, 68)
    
    --[[
    BuildingManager:NavigateCells()
    BuildingManager.gridview:drawInRect(267, 113, 136, 128)
    ]]
end

