local pd <const> = playdate
local gfx <const> = pd.graphics

--The Table that stores all the upgrade information
Upgrades = {}

--Adds the button information to the upgrades table
function insertUpgrade(type, cost, multiplier, imagepath, selectedImagePath, num)
    local upgrade = {type, cost, multiplier, imagepath, selectedImagePath, num}
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
    insertUpgrade("Gear", 100, 2, gearImage, selectedGearImage, 1)
    insertUpgrade("Gear", 400, 2, gearImage, selectedGearImage, 2)
    insertUpgrade("Gear", 10000, 2, gearImage, selectedGearImage, 3)
    insertUpgrade("Gear", 500000, 2, gearImage, selectedGearImage, 4)
    insertUpgrade("Gear", 50000000, 2, gearImage, selectedGearImage, 5)
    insertUpgrade("Gear", 500000000, 2, gearImage, selectedGearImage, 6)
    insertUpgrade("Gear", 5000000000, 2, gearImage, selectedGearImage, 7)
    insertUpgrade("Gear", 50000000000, 2, gearImage, selectedGearImage, 8)
    insertUpgrade("Gear", 50000000000000, 2, gearImage, selectedGearImage, 9)
    insertUpgrade("Gear", 50000, 2, gearImage, selectedGearImage, 10)
    insertUpgrade("Gear", 5000000, 2, gearImage, selectedGearImage, 11)
    insertUpgrade("Gear", 500000000, 2, gearImage, selectedGearImage, 12)
    insertUpgrade("Gear", 50000000000, 2, gearImage, selectedGearImage, 13)

    insertUpgrade("Factory", 1000, 2, factoryImage, selectedFactoryImage, 14)
    insertUpgrade("Factory", 10000, 2, factoryImage, selectedFactoryImage, 15)
    insertUpgrade("Factory", 100000, 2, factoryImage, selectedFactoryImage, 16)
    insertUpgrade("Factory", 1000000, 2, factoryImage, selectedFactoryImage, 17)
    insertUpgrade("Factory", 50000, 2, factoryImage, selectedFactoryImage, 18)
    insertUpgrade("Factory", 300000, 2, factoryImage, selectedFactoryImage, 19)
    insertUpgrade("Factory", 1000000, 2, factoryImage, selectedFactoryImage, 20)
    insertUpgrade("Factory", 4000000, 2, factoryImage, selectedFactoryImage, 21)
    insertUpgrade("Factory", 20000000, 2, factoryImage, selectedFactoryImage, 22)
    insertUpgrade("Factory", 166666600, 2, factoryImage, selectedFactoryImage, 23)
    insertUpgrade("Factory", 12345678900, 2, factoryImage, selectedFactoryImage, 24)
    
    insertUpgrade("Mine", 5000, 2, mineImage, selectedMineImage, 25)
    insertUpgrade("Mine", 50000, 2, mineImage, selectedMineImage, 26)
    insertUpgrade("Mine", 500000, 2, mineImage, selectedMineImage, 27)
    insertUpgrade("Mine", 5000000, 2, mineImage, selectedMineImage, 28)
    
    insertUpgrade("Car", 30000, 2, carImage, selectedCarImage, 29)
    insertUpgrade("Car", 300000, 2, carImage, selectedCarImage, 30)
    insertUpgrade("Car", 3000000, 2, carImage, selectedCarImage, 31)
    insertUpgrade("Car", 30000000, 2, carImage, selectedCarImage, 32)

    insertUpgrade("Rocket", 100000, 2, rocketImage, selectedRocketImage, 33)
    insertUpgrade("Rocket", 1000000, 2, rocketImage, selectedRocketImage, 34)
    insertUpgrade("Rocket", 10000000, 2, rocketImage, selectedRocketImage, 35)
    insertUpgrade("Rocket", 100000000, 2, rocketImage, selectedRocketImage, 36)

    insertUpgrade("Fifth", 400000, 2, fifthImage, selectedFifthImage, 37)
    insertUpgrade("Fifth", 4000000, 2, fifthImage, selectedFifthImage, 38)
    insertUpgrade("Fifth", 40000000, 2, fifthImage, selectedFifthImage, 39)
    insertUpgrade("Fifth", 400000000, 2, fifthImage, selectedFifthImage, 40)
    
    insertUpgrade("Sixth", 2000000, 2, sixthImage, selectedSixthImage, 41)
    insertUpgrade("Sixth", 20000000, 2, sixthImage, selectedSixthImage, 42)
    insertUpgrade("Sixth", 200000000, 2, sixthImage, selectedSixthImage, 43)
    insertUpgrade("Sixth", 2000000000, 2, sixthImage, selectedSixthImage, 44)

    insertUpgrade("Seventh", 16666660, 2, seventhImage, selectedSeventhImage, 45)
    insertUpgrade("Seventh", 166666600, 2, seventhImage, selectedSeventhImage, 46)
    insertUpgrade("Seventh", 1666666000, 2, seventhImage, selectedSeventhImage, 47)
    insertUpgrade("Seventh", 16666660000, 2, seventhImage, selectedSeventhImage, 48)

    insertUpgrade("Eighth", 1234567890, 2, eigthImage, selectedEightImage, 49)
    insertUpgrade("Eighth", 9876543210, 2, eigthImage, selectedEightImage, 50)
    insertUpgrade("Eighth", 98765456789, 2, eigthImage, selectedEightImage, 51)
    insertUpgrade("Eighth", 1234567890000, 2, eigthImage, selectedEightImage, 52)

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