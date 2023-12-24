local pd <const> = playdate
local gfx <const> = pd.graphics

--The Table that stores all the upgrade information
Upgrades = {}

--Adds the button information to the upgrades table
function insertUpgrade(type, cost, multiplier, image, selectedImage, num, gearBase)
    local upgrade = {TYPE = type, COST = cost, MULTIPLIER = multiplier, IMAGE = image, SELECTEDIMAGE = selectedImage, NUM = num, GEARBASE = gearBase}
    table.insert(Upgrades, upgrade)
end

UpgradeBaseNames = {"", "Thousand", "Million", "Billion", "Trillion"}

--All the button Images
local gearImage = gfx.image.new("Images/upgradeIcons/upgradeIcon")
local selectedGearImage = gfx.image.new("Images/upgradeIcons/SelectedGearIcon")

local mineImage = gfx.image.new("Images/upgradeIcons/mineUpgradeIcon")
local selectedMineImage = gfx.image.new("Images/upgradeIcons/selectedMineIcon")

local factoryImage = gfx.image.new("Images/upgradeIcons/FactoryIcon")
local selectedFactoryImage = gfx.image.new("Images/upgradeIcons/selectedFactoryIcon")

local carImage = gfx.image.new("images/upgradeIcons/carUpgradeIcon")
local selectedCarImage = gfx.image.new("images/upgradeIcons/selectedCarIcon")

local rocketImage = gfx.image.new("images/upgradeIcons/rocketUpgradeIcon")
local selectedRocketImage = gfx.image.new("images/upgradeIcons/selectedRocketIcon")

local fifthImage = gfx.image.new("Images/upgradeIcons/fifthUpgradeIcon")
local selectedFifthImage = gfx.image.new("Images/upgradeIcons/selectedFifthIcon")

local sixthImage = gfx.image.new("Images/upgradeIcons/sixthUpgradeIcon")
local selectedSixthImage = gfx.image.new("Images/upgradeIcons/selectedSixthIcon")

local seventhImage = gfx.image.new("Images/upgradeIcons/seventhUpgradeIcon")
local selectedSeventhImage = gfx.image.new("Images/upgradeIcons/selectedSeventhUpgradeIcon")

local eigthImage = gfx.image.new("Images/upgradeIcons/eightUpgradeIcon")
local selectedEightImage = gfx.image.new("Images/upgradeIcons/selectedEightUpgradeIcon")

--Creates all the button information
function createUpgrades()
    insertUpgrade("Gear", 100, 2, gearImage, selectedGearImage, 1, 1)
    insertUpgrade("Gear", 400, 2, gearImage, selectedGearImage, 2, 1)
    insertUpgrade("Gear", 10, 2, gearImage, selectedGearImage, 3, 2)
    insertUpgrade("Gear", 500, 2, gearImage, selectedGearImage, 4, 2)
    insertUpgrade("Gear", 50, 2, gearImage, selectedGearImage, 5, 3)
    insertUpgrade("Gear", 500, 2, gearImage, selectedGearImage, 6, 3)
    insertUpgrade("Gear", 5, 2, gearImage, selectedGearImage, 7, 4)
    insertUpgrade("Gear", 50, 2, gearImage, selectedGearImage, 8, 4)
    insertUpgrade("Gear", 50, 2, gearImage, selectedGearImage, 9, 5)
    insertUpgrade("Gear", 50, 2, gearImage, selectedGearImage, 10, 2)
    insertUpgrade("Gear", 5, 2, gearImage, selectedGearImage, 11, 3)
    insertUpgrade("Gear", 500, 2, gearImage, selectedGearImage, 12, 3)
    insertUpgrade("Gear", 50, 2, gearImage, selectedGearImage, 13, 3)

    insertUpgrade(1, 1, 2, factoryImage, selectedFactoryImage, 14, 2)
    insertUpgrade(1, 10, 2, factoryImage, selectedFactoryImage, 15, 2)
    insertUpgrade(1, 100, 2, factoryImage, selectedFactoryImage, 16, 2)
    insertUpgrade(1, 1, 2, factoryImage, selectedFactoryImage, 17, 3)
    insertUpgrade(1, 50, 2, factoryImage, selectedFactoryImage, 18, 2)
    insertUpgrade(1, 300, 2, factoryImage, selectedFactoryImage, 19, 2)
    insertUpgrade(1, 1, 2, factoryImage, selectedFactoryImage, 20, 3)
    insertUpgrade(1, 4, 2, factoryImage, selectedFactoryImage, 21, 3)
    insertUpgrade(1, 20, 2, factoryImage, selectedFactoryImage, 22, 3)
    insertUpgrade(1, 166.666, 2, factoryImage, selectedFactoryImage, 23, 3)
    insertUpgrade(1, 12.345, 2, factoryImage, selectedFactoryImage, 24, 4)
    
    insertUpgrade(2, 5, 2, mineImage, selectedMineImage, 25, 2)
    insertUpgrade(2, 50, 2, mineImage, selectedMineImage, 26, 2)
    insertUpgrade(2, 500, 2, mineImage, selectedMineImage, 27, 2)
    insertUpgrade(2, 5, 2, mineImage, selectedMineImage, 28, 3)
    
    insertUpgrade(3, 30, 2, carImage, selectedCarImage, 29, 2)
    insertUpgrade(3, 300, 2, carImage, selectedCarImage, 30, 2)
    insertUpgrade(3, 3, 2, carImage, selectedCarImage, 31, 3)
    insertUpgrade(3, 30, 2, carImage, selectedCarImage, 32, 3)

    insertUpgrade(4, 100, 2, rocketImage, selectedRocketImage, 33, 2)
    insertUpgrade(4, 1, 2, rocketImage, selectedRocketImage, 34, 3)
    insertUpgrade(4, 10, 2, rocketImage, selectedRocketImage, 35, 3)
    insertUpgrade(4, 100, 2, rocketImage, selectedRocketImage, 36, 3)

    insertUpgrade(5, 400, 2, fifthImage, selectedFifthImage, 37, 2)
    insertUpgrade(5, 4, 2, fifthImage, selectedFifthImage, 38, 3)
    insertUpgrade(5, 40, 2, fifthImage, selectedFifthImage, 39, 3)
    insertUpgrade(5, 400, 2, fifthImage, selectedFifthImage, 40, 3)
    
    insertUpgrade(6, 2, 2, sixthImage, selectedSixthImage, 41, 3)
    insertUpgrade(6, 20, 2, sixthImage, selectedSixthImage, 42, 3)
    insertUpgrade(6, 200, 2, sixthImage, selectedSixthImage, 43, 3)
    insertUpgrade(6, 2, 2, sixthImage, selectedSixthImage, 44, 4)

    insertUpgrade(7, 16.666, 2, seventhImage, selectedSeventhImage, 45, 3)
    insertUpgrade(7, 166.666, 2, seventhImage, selectedSeventhImage, 46, 3)
    insertUpgrade(7, 1.666, 2, seventhImage, selectedSeventhImage, 47, 4)
    insertUpgrade(7, 16.666, 2, seventhImage, selectedSeventhImage, 48, 4)

    insertUpgrade(8, 1.234, 2, eigthImage, selectedEightImage, 49, 4)
    insertUpgrade(8, 9.876, 2, eigthImage, selectedEightImage, 50, 4)
    insertUpgrade(8, 98.765, 2, eigthImage, selectedEightImage, 51, 4)
    insertUpgrade(8, 1.234, 2, eigthImage, selectedEightImage, 52, 5)
    
    table.sort(Upgrades, function(a, b)
        if a.GEARBASE > b.GEARBASE then
            return a.GEARBASE < b.GEARBASE
        elseif a.GEARBASE < b.GEARBASE then
            return a.GEARBASE < b.GEARBASE
        else
            return a.COST < b.COST
        end
    end)
end

--navigates the upgrade cells
function NavigateUpgradeCells(gridView)
    local _, selectedRow, _ = gridView:getSelection()
    local lastRow = gridView:getNumberOfRowsInSection(1)

    if pd.buttonJustPressed(pd.kButtonUp) then
        if selectedRow == 1 then
            selectedGridView = 1
            upgradeType:setImage(nil)
            upgradeCost:setImage(nil)
            upgradeMultiplier:setImage(nil)
        else
            gridView:selectPreviousRow(false)
        end
    elseif pd.buttonJustPressed(pd.kButtonDown) then
        if selectedRow < lastRow then
            gridView:selectNextRow(false)
        else
            selectedGridView = 3
            upgradeType:setImage(nil)
            upgradeCost:setImage(nil)
            upgradeMultiplier:setImage(nil)
        end
    elseif pd.buttonJustPressed(pd.kButtonLeft) then
        gridView:selectPreviousColumn(false)
    elseif pd.buttonJustPressed(pd.kButtonRight) then
        gridView:selectNextColumn(false)
    end
end