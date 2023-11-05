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

local sixthImage = gfx.image.new("Images/buildingIcons/6thBuilding")
local selectedSixthImage = gfx.image.new("Images/buildingIcons/Selected6thBuilding")
sixthMultipliers = {1}

local seventhImage = gfx.image.new("Images/buildingIcons/7thBuilding")
local selectedSeventhImage = gfx.image.new("Images/buildingIcons/Selected7thBuilding")
seventhMultipliers = {1}

local eighthImage = gfx.image.new("Images/buildingIcons/8thBuilding")
local selectedEighthImage = gfx.image.new("Images/buildingIcons/Selected8thBuilding")
eighthMultipliers = {1}

buildingMultipliers = {factoryMultipliers, mineMultipliers, carMultipliers, rocketMultipliers, fifthMultipliers, sixthMultipliers, seventhMultipliers, eighthMultipliers}

--Creates all the button information
function BuildingManager:createUpgrades()
    BuildingManager:Upgrades("Factory", 0, 15, 0, 0.1, 1.15, factoryImage, selectedFactoryImage)
    BuildingManager:Upgrades("Mine", 0, 100, 0, 0.5, 1.15, mineImage, selectedMineImage)
    BuildingManager:Upgrades("Car", 0, 500, 0, 2, 1.15, carImage, selectedCarImage)
    BuildingManager:Upgrades("Rocket", 0, 3000, 0, 10, 1.15, rocketImage, selectedRocketImage)
    BuildingManager:Upgrades("Fifth", 0, 10000, 0, 40, 1.15, fifthImage, selectedFifthImage)
    BuildingManager:Upgrades("Sixth", 0, 40000, 0, 100, 1.15, sixthImage, selectedSixthImage)
    BuildingManager:Upgrades("Seventh", 0, 200000, 0, 400, 1.15, seventhImage, selectedSeventhImage)
    BuildingManager:Upgrades("Eighth", 0, 1666666, 0, 6666, 1.15, eighthImage, selectedEighthImage)
end