local pd <const> = playdate
local gfx <const> = pd.graphics

--The Table that stores all the upgrade information
Upgrades = {}

--Adds the button information to the upgrades table
function insertUpgrade(type, cost, multiplier, imagepath, selectedImagePath)
    local upgrade = {type, cost, multiplier, imagepath, selectedImagePath}
    table.insert(Upgrades, upgrade)
end

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
    insertUpgrade("Gear", 100, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 400, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 10000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 500000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 50000000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 500000000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 5000000000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 50000000000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 50000000000000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 50000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 5000000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 500000000, 2, gearImage, selectedGearImage)
    insertUpgrade("Gear", 50000000000, 2, gearImage, selectedGearImage)

    insertUpgrade("Factory", 1000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 10000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 100000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 1000000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 50000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 300000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 1000000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 4000000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 20000000, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 166666600, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Factory", 12345678900, 2, factoryImage, selectedFactoryImage)
    
    insertUpgrade("Mine", 5000, 2, mineImage, selectedMineImage)
    insertUpgrade("Mine", 50000, 2, mineImage, selectedMineImage)
    insertUpgrade("Mine", 500000, 2, mineImage, selectedMineImage)
    insertUpgrade("Mine", 5000000, 2, mineImage, selectedMineImage)
    
    insertUpgrade("Car", 30000, 2, carImage, selectedCarImage)
    insertUpgrade("Car", 300000, 2, carImage, selectedCarImage)
    insertUpgrade("Car", 3000000, 2, carImage, selectedCarImage)
    insertUpgrade("Car", 30000000, 2, carImage, selectedCarImage)

    insertUpgrade("Rocket", 100000, 2, rocketImage, selectedRocketImage)
    insertUpgrade("Rocket", 1000000, 2, rocketImage, selectedRocketImage)
    insertUpgrade("Rocket", 10000000, 2, rocketImage, selectedRocketImage)
    insertUpgrade("Rocket", 100000000, 2, rocketImage, selectedRocketImage) -- mine in sheets

    insertUpgrade("Fifth", 400000, 2, fifthImage, selectedFifthImage)
    insertUpgrade("Fifth", 4000000, 2, fifthImage, selectedFifthImage)
    insertUpgrade("Fifth", 40000000, 2, fifthImage, selectedFifthImage)
    insertUpgrade("Fifth", 400000000, 2, fifthImage, selectedFifthImage)
    
    insertUpgrade("Sixth", 2000000, 2, sixthImage, selectedSixthImage)
    insertUpgrade("Sixth", 20000000, 2, sixthImage, selectedSixthImage)
    insertUpgrade("Sixth", 200000000, 2, sixthImage, selectedSixthImage)
    insertUpgrade("Sixth", 2000000000, 2, sixthImage, selectedSixthImage)

    insertUpgrade("Seventh", 16666660, 2, seventhImage, selectedSeventhImage)
    insertUpgrade("Seventh", 166666600, 2, seventhImage, selectedSeventhImage)
    insertUpgrade("Seventh", 1666666000, 2, seventhImage, selectedSeventhImage)
    insertUpgrade("Seventh", 16666660000, 2, seventhImage, selectedSeventhImage)

    insertUpgrade("Eighth", 1234567890, 2, eigthImage, selectedEightImage)
    insertUpgrade("Eighth", 9876543210, 2, eigthImage, selectedEightImage)
    insertUpgrade("Eighth", 98765456789, 2, eigthImage, selectedEightImage)
    insertUpgrade("Eighth", 1234567890000, 2, eigthImage, selectedEightImage)

    sortTable(Upgrades)
end

function NavigateUpgradeCells(gridView)
    local _, selectedRow, _ = gridView:getSelection()
    local lastRow = gridView:getNumberOfRowsInSection(1)

    if pd.buttonJustPressed(pd.kButtonUp) then
        gridView:selectPreviousRow(false)
    elseif pd.buttonJustPressed(pd.kButtonDown) then
        if selectedRow < lastRow then
            gridView:selectNextRow(false)
        else
            selectedGridView = 1
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

function sortTable(upgradeTable)
    table.sort(upgradeTable, function(a, b) return a[2] < b[2] end)
end