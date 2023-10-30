local pd <const> = playdate
local gfx <const> = pd.graphics

--Is just used to call functions (Is this even necessary?)
BuildingManager = {}

--The Table that stores all the upgrade information
Buildings = {}

--Adds the button information to the upgrades table
function BuildingManager:Upgrades(buildingName, amount, cost, totalGPS, incrementalGPS, incrementalCost, imagepath, selectedImagePath)
    local building = {buildingName, amount, cost, totalGPS, incrementalGPS, incrementalCost, imagepath, selectedImagePath}
    table.insert(Buildings, building)
end

--All the button Images
local factoryImage = gfx.image.new("Images/buildingIcons/FactoryBuilding")
local selectedFactoryImage = gfx.image.new("Images/buildingIcons/SelectedFactoryBuilding")
factoryMultipliers = {}

local mineImage = gfx.image.new("Images/buildingIcons/MineBuilding")
local selectedMineImage = gfx.image.new("Images/buildingIcons/SelectedMineBuilding")
mineMultipliers = {}

local carImage = gfx.image.new("Images/buildingIcons/CarBuilding")
local selectedCarImage = gfx.image.new("Images/buildingIcons/SelectedCarBuilding")
carMultipliers = {}

local rocketImage = gfx.image.new("Images/buildingIcons/RocketBuilding.png")
local selectedRocketImage = gfx.image.new("Images/buildingIcons/SelectedRocketBuilding.png")
rocketMultipliers = {}

--Creates all the button information
function BuildingManager:createUpgrades()
    BuildingManager:Upgrades("Factory", 0, 10, 0, 0.2, 1, factoryImage, selectedFactoryImage)
    BuildingManager:Upgrades("Mine", 0, 100, 0, 1, 5, mineImage, selectedMineImage)
    BuildingManager:Upgrades("Car", 0, 750, 0, 5, 50, carImage, selectedCarImage)
    BuildingManager:Upgrades("Rocket", 0, 2500, 0, 25, 250, rocketImage, selectedRocketImage)
end