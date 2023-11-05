local pd <const> = playdate
local gfx <const> = pd.graphics

--Is just used to call functions (Is this even necessary?)
UpgradeManager = {}

--The Table that stores all the upgrade information
Upgrades = {}

--Adds the button information to the upgrades table
function UpgradeManager:Upgrades(type, cost, multiplier, imagepath, selectedImagePath)
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
function UpgradeManager:createUpgrades()
    UpgradeManager:Upgrades("Gear", 100, 2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 20, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Mine", 15, 2, mineImage, selectedMineImage)
    UpgradeManager:Upgrades("Car", 25, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 30, 2, rocketImage, selectedRocketImage)

    UpgradeManager:Upgrades("Gear", 400, 2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 45, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Mine", 40, 2, mineImage, selectedMineImage)
    UpgradeManager:Upgrades("Car", 50, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 55, 2, rocketImage, selectedRocketImage)

    UpgradeManager:Upgrades("Gear", 10000, 2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 70, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Mine", 65, 2, mineImage, selectedMineImage)
    UpgradeManager:Upgrades("Car", 75, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 80, 2, rocketImage, selectedRocketImage)

    UpgradeManager:Upgrades("Gear", 50000, 2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 95, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Mine", 90, 2, mineImage, selectedMineImage)
    UpgradeManager:Upgrades("Car", 100, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 105, 2, rocketImage, selectedRocketImage)
end