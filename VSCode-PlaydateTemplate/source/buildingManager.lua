local pd <const> = playdate
local gfx <const> = pd.graphics

--The Table that stores all the upgrade information
Buildings = {}

--Adds the button information to the upgrades table
function Building(name, amount, cost, totalGPS, incrementalGPS, incrementalCost, image, selectedImage)
    local building = {NAME = name, AMOUNT = amount, COST = cost, TOTALGPS = totalGPS, INCREMENTALGPS = incrementalGPS, INCREMENTALCOST = incrementalCost, IMAGE = image, SELECTEDIMAGE = selectedImage}
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
function createBuildings()
    Building("Factory", 0, 15, 0, 0.1, 1.15, factoryImage, selectedFactoryImage)
    Building("Mine", 0, 100, 0, 0.5, 1.15, mineImage, selectedMineImage)
    Building("Car", 0, 1100, 0, 2, 1.15, carImage, selectedCarImage)
    Building("Rocket", 0, 12000, 0, 10, 1.15, rocketImage, selectedRocketImage)
    Building("Fifth", 0, 1400000, 0, 40, 1.15, fifthImage, selectedFifthImage)
    Building("Sixth", 0, 20000000, 0, 100, 1.15, sixthImage, selectedSixthImage)
    Building("Seventh", 0, 330000000, 0, 400, 1.15, seventhImage, selectedSeventhImage)
    Building("Eighth", 0, 5100000000, 0, 6666, 1.15, eighthImage, selectedEighthImage)
    createdBuildings = true
end

--navigates the building cells
function NavigateBuildingCells(gridview)
    local _, selectedRow, _ = gridview:getSelection()

    if pd.buttonJustPressed(pd.kButtonUp) then
        if selectedRow == 1 then
            selectedGridView = 2
            buildingNumber:setImage(nil)
            buildingCost:setImage(nil)
            buildingGPS:setImage(nil)
        else
            gridview:selectPreviousRow(false)
        end
    elseif pd.buttonJustPressed(pd.kButtonDown) then
        gridview:selectNextRow(false)
    elseif pd.buttonJustPressed(pd.kButtonLeft) then
        gridview:selectPreviousColumn(false)
    elseif pd.buttonJustPressed(pd.kButtonRight) then
        gridview:selectNextColumn(false)
    end
end