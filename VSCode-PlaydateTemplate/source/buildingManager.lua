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
factoryMultipliers = {1}

local mineImage = gfx.image.new("Images/buildingIcons/MineBuilding")
local selectedMineImage = gfx.image.new("Images/buildingIcons/SelectedMineBuilding")
mineMultipliers = {1}

local carImage = gfx.image.new("Images/buildingIcons/CarBuilding")
local selectedCarImage = gfx.image.new("Images/buildingIcons/SelectedCarBuilding")
carMultipliers = {1}

local rocketImage = gfx.image.new("Images/buildingIcons/RocketBuilding")
local selectedRocketImage = gfx.image.new("Images/buildingIcons/SelectedRocketBuilding")
rocketMultipliers = {1}

local fifthImage = gfx.image.new("Images/buildingIcons/5thBuilding")
local selectedFifthImage = gfx.image.new("Images/buildingIcons/Selected5thBuilding")
fifthMultipliers = {1}

--Creates all the button information
function BuildingManager:createUpgrades()
    BuildingManager:Upgrades("Factory", 0, 10, 0, 0.2, 1.15, factoryImage, selectedFactoryImage)
    BuildingManager:Upgrades("Mine", 0, 100, 0, 1, 1.15, mineImage, selectedMineImage)
    BuildingManager:Upgrades("Car", 0, 500, 0, 5, 1.15, carImage, selectedCarImage)
    BuildingManager:Upgrades("Rocket", 0, 3000, 0, 25, 1.15, rocketImage, selectedRocketImage)
    BuildingManager:Upgrades("Fifth", 0, 6000, 0, 50, 1.15, fifthImage, selectedFifthImage)
end