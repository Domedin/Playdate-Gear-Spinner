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

--Creates all the button information
function createUpgrades()
    insertUpgrade("Gear", 100, 2, gearImage, selectedGearImage)
    insertUpgrade("Factory", 20, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Mine", 15, 2, mineImage, selectedMineImage)
    insertUpgrade("Car", 25, 2, carImage, selectedCarImage)
    insertUpgrade("Rocket", 30, 2, rocketImage, selectedRocketImage)

    insertUpgrade("Gear", 400, 2, gearImage, selectedGearImage)
    insertUpgrade("Factory", 45, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Mine", 40, 2, mineImage, selectedMineImage)
    insertUpgrade("Car", 50, 2, carImage, selectedCarImage)
    insertUpgrade("Rocket", 55, 2, rocketImage, selectedRocketImage)

    insertUpgrade("Gear", 10000, 2, gearImage, selectedGearImage)
    insertUpgrade("Factory", 70, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Mine", 65, 2, mineImage, selectedMineImage)
    insertUpgrade("Car", 75, 2, carImage, selectedCarImage)
    insertUpgrade("Rocket", 80, 2, rocketImage, selectedRocketImage)

    insertUpgrade("Gear", 50000, 2, gearImage, selectedGearImage)
    insertUpgrade("Factory", 95, 2, factoryImage, selectedFactoryImage)
    insertUpgrade("Mine", 90, 2, mineImage, selectedMineImage)
    insertUpgrade("Car", 100, 2, carImage, selectedCarImage)
    insertUpgrade("Rocket", 105, 2, rocketImage, selectedRocketImage)
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
    local length = #upgradeTable
    -- Tell if a should come before b
    -- The <= to handle equal values

    for pass = 1, math.huge do
        local swapped  -- a bool to determine if we swapped this pass

        for i = 1, length - 1 do
            print("table:", upgradeTable[i][2])
            print("i:", i)
            print("length:", length)
            local a = upgradeTable[i][2]
            -- The next value, b
            local b = upgradeTable[i + 1][2]
            -- Tell if a should come after b
            -- Swap if it didn't pass the order check
            if a > b then
                upgradeTable[i + 1] = a
                upgradeTable[i] = b
                swapped = true
            end
        end

        -- Everything is sorted when there are no swaps in this pass
        if not swapped then
            break
        end
    end
end