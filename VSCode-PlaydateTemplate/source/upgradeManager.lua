local pd <const> = playdate
local gfx <const> = pd.graphics

--The Table that stores all the upgrade information
Upgrades = {}

--Adds the button information to the upgrades table
function insertUpgrade(type, cost, multiplier, image, selectedImage, num)
    local upgrade = {TYPE = type, COST = cost, MULTIPLIER = multiplier, IMAGE = image, SELECTEDIMAGE = selectedImage, NUM = num}
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
    insertUpgrade(1, 100, 2, gearImage, selectedGearImage, 1)
    insertUpgrade(1, 400, 2, gearImage, selectedGearImage, 2)
    insertUpgrade(1, 10000, 2, gearImage, selectedGearImage, 3)
    insertUpgrade(1, 500000, 2, gearImage, selectedGearImage, 4)
    insertUpgrade(1, 50000000, 2, gearImage, selectedGearImage, 5)
    insertUpgrade(1, 500000000, 2, gearImage, selectedGearImage, 6)
    insertUpgrade(1, 5000000000, 2, gearImage, selectedGearImage, 7)
    insertUpgrade(1, 50000000000, 2, gearImage, selectedGearImage, 8)
    insertUpgrade(1, 50000000000000, 2, gearImage, selectedGearImage, 9)
    insertUpgrade(1, 50000, 2, gearImage, selectedGearImage, 10)
    insertUpgrade(1, 5000000, 2, gearImage, selectedGearImage, 11)
    insertUpgrade(1, 500000000, 2, gearImage, selectedGearImage, 12)
    insertUpgrade(1, 50000000000, 2, gearImage, selectedGearImage, 13)

    insertUpgrade(2, 1000, 2, factoryImage, selectedFactoryImage, 14)
    insertUpgrade(2, 10000, 2, factoryImage, selectedFactoryImage, 15)
    insertUpgrade(2, 100000, 2, factoryImage, selectedFactoryImage, 16)
    insertUpgrade(2, 1000000, 2, factoryImage, selectedFactoryImage, 17)
    insertUpgrade(2, 50000, 2, factoryImage, selectedFactoryImage, 18)
    insertUpgrade(2, 300000, 2, factoryImage, selectedFactoryImage, 19)
    insertUpgrade(2, 1000000, 2, factoryImage, selectedFactoryImage, 20)
    insertUpgrade(2, 4000000, 2, factoryImage, selectedFactoryImage, 21)
    insertUpgrade(2, 20000000, 2, factoryImage, selectedFactoryImage, 22)
    insertUpgrade(2, 166666600, 2, factoryImage, selectedFactoryImage, 23)
    insertUpgrade(2, 12345678900, 2, factoryImage, selectedFactoryImage, 24)
    
    insertUpgrade(3, 5000, 2, mineImage, selectedMineImage, 25)
    insertUpgrade(3, 50000, 2, mineImage, selectedMineImage, 26)
    insertUpgrade(3, 500000, 2, mineImage, selectedMineImage, 27)
    insertUpgrade(3, 5000000, 2, mineImage, selectedMineImage, 28)
    
    insertUpgrade(4, 30000, 2, carImage, selectedCarImage, 29)
    insertUpgrade(4, 300000, 2, carImage, selectedCarImage, 30)
    insertUpgrade(4, 3000000, 2, carImage, selectedCarImage, 31)
    insertUpgrade(4, 30000000, 2, carImage, selectedCarImage, 32)

    insertUpgrade(5, 100000, 2, rocketImage, selectedRocketImage, 33)
    insertUpgrade(5, 1000000, 2, rocketImage, selectedRocketImage, 34)
    insertUpgrade(5, 10000000, 2, rocketImage, selectedRocketImage, 35)
    insertUpgrade(5, 100000000, 2, rocketImage, selectedRocketImage, 36)

    insertUpgrade(6, 400000, 2, fifthImage, selectedFifthImage, 37)
    insertUpgrade(6, 4000000, 2, fifthImage, selectedFifthImage, 38)
    insertUpgrade(6, 40000000, 2, fifthImage, selectedFifthImage, 39)
    insertUpgrade(6, 400000000, 2, fifthImage, selectedFifthImage, 40)
    
    insertUpgrade(7, 2000000, 2, sixthImage, selectedSixthImage, 41)
    insertUpgrade(7, 20000000, 2, sixthImage, selectedSixthImage, 42)
    insertUpgrade(7, 200000000, 2, sixthImage, selectedSixthImage, 43)
    insertUpgrade(7, 2000000000, 2, sixthImage, selectedSixthImage, 44)

    insertUpgrade(8, 16666660, 2, seventhImage, selectedSeventhImage, 45)
    insertUpgrade(8, 166666600, 2, seventhImage, selectedSeventhImage, 46)
    insertUpgrade(8, 1666666000, 2, seventhImage, selectedSeventhImage, 47)
    insertUpgrade(8, 16666660000, 2, seventhImage, selectedSeventhImage, 48)

    insertUpgrade(9, 1234567890, 2, eigthImage, selectedEightImage, 49)
    insertUpgrade(9, 9876543210, 2, eigthImage, selectedEightImage, 50)
    insertUpgrade(9, 98765456789, 2, eigthImage, selectedEightImage, 51)
    insertUpgrade(9, 1234567890000, 2, eigthImage, selectedEightImage, 52)

    table.sort(Upgrades, function(a, b) return a.COST < b.COST end)
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