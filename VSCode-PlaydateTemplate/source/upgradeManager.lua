local pd <const> = playdate
local gfx <const> = pd.graphics

--Is just used to call functions (Is this even necessary?)
UpgradeManager = {}

--The Table that stores all the upgrade information
Upgrades = {}

--Adds the button information to the upgrades table
function UpgradeManager:Upgrades(type, cost, multiplier, imagepath, selectedImagePath, upgradeType, upgradeCost)
    local upgrade = {type, cost, multiplier, imagepath, selectedImagePath}
    table.insert(Upgrades, upgrade)
end

--All the button Images
local gearImage = gfx.image.new("Images/upgradeIcons/upgradeIcon")
local selectedGearImage = gfx.image.new("Images/upgradeIcons/SelectedGearIcon")

local factoryImage = gfx.image.new("Images/upgradeIcons/FactoryIcon")
local selectedFactoryImage = gfx.image.new("Images/upgradeIcons/selectedFactoryIcon")

local carImage = gfx.image.new("images/upgradeIcons/carUpgradeIcon")
local selectedCarImage = gfx.image.new("images/upgradeIcons/selectedCarIcon")

local rocketImage = gfx.image.new("images/upgradeIcons/rocketUpgradeIcon")
local selectedRocketImage = gfx.image.new("images/upgradeIcons/selectedRocketIcon")

--Creates all the button information
function UpgradeManager:createUpgrades()
    UpgradeManager:Upgrades("Gear", 10, 1.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 15, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Car", 20, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 25, 2, rocketImage, selectedRocketImage)
    UpgradeManager:Upgrades("Gear", 30, 1.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 35, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Car", 40, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 45, 2, rocketImage, selectedRocketImage)
    UpgradeManager:Upgrades("Gear", 50, 1.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 55, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Car", 60, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 65, 2, rocketImage, selectedRocketImage)
    UpgradeManager:Upgrades("Gear", 70, 1.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades("Factory", 75, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades("Car", 80, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades("Rocket", 85, 2, rocketImage, selectedRocketImage)
end