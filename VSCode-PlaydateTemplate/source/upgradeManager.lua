local pd <const> = playdate
local gfx <const> = pd.graphics

UpgradeManager = {}

Upgrades = {}

function UpgradeManager:Upgrades(numInOrder, type, cost, multiplier, imagepath, selectedImagePath)
    local upgrade = {numInOrder, type, cost, multiplier, imagepath, selectedImagePath}
    table.insert(Upgrades, upgrade)
    for i,upgrade in ipairs(Upgrades) do
        print(upgrade[1])
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

function UpgradeManager:createUpgrades()
    UpgradeManager:Upgrades(1, "Gear", 10, 0.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades(2, "Factory", 15, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades(3, "Car", 20, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades(4, "Rocket", 25, 2, rocketImage, selectedRocketImage)
    UpgradeManager:Upgrades(5, "Gear", 30, 0.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades(6, "Factory", 35, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades(7, "Car", 40, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades(8, "Rocket", 45, 2, rocketImage, selectedRocketImage)
    UpgradeManager:Upgrades(9, "Gear", 50, 0.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades(10, "Factory", 55, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades(11, "Car", 60, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades(12, "Rocket", 65, 2, rocketImage, selectedRocketImage)
    UpgradeManager:Upgrades(13, "Gear", 70, 0.2, gearImage, selectedGearImage)
    UpgradeManager:Upgrades(14, "Factory", 75, 2, factoryImage, selectedFactoryImage)
    UpgradeManager:Upgrades(15, "Car", 80, 2, carImage, selectedCarImage)
    UpgradeManager:Upgrades(16, "Rocket", 85, 2, rocketImage, selectedRocketImage)
end