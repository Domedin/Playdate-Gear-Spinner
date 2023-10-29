local pd <const> = playdate
local gfx <const> = pd.graphics

--Is just used to call functions (Is this even necessary?)
BuildingManager = {}

--The Table that stores all the upgrade information
Buildings = {}

--Adds the button information to the upgrades table
function BuildingManager:Upgrades(numInOrder, amount, cost, gps, imagepath, selectedImagePath)
    local building = {numInOrder, amount, cost, gps, imagepath, selectedImagePath}
    table.insert(Buildings, building)
end

--All the button Images
local factoryImage = gfx.image.new("Images/buildingIcons/FactoryBuilding")
local selectedFactoryImage = gfx.image.new("Images/buildingIcons/SelectedFactoryBuilding")

local carImage = gfx.image.new("Images/buildingIcons/CarBuilding")
local selectedCarImage = gfx.image.new("Images/buildingIcons/SelectedCarBuilding")

local rocketImage = gfx.image.new("Images/buildingIcons/RocketBuilding.png")
local selectedRocketImage = gfx.image.new("Images/buildingIcons/SelectedRocketBuilding.png")

--Creates all the button information
function BuildingManager:createUpgrades()
    BuildingManager:Upgrades("Factory", 0, 10, 0, factoryImage, selectedFactoryImage)
    BuildingManager:Upgrades("Car", 0, 50, 0, carImage, selectedCarImage)
    BuildingManager:Upgrades("Rocket", 0, 250, 0, rocketImage, selectedRocketImage)
end