local pd <const> = playdate
local gfx <const> = pd.graphics

class('Building').extends(gfx.sprite)

function Building:init(column, type, cost, revenue, imagepath)
    self.column = column
    self.revenue = revenue
    self.type = type
    self.image = gfx.image.new(imagepath)
    self.cost = cost

    --self:setImage(self.image)
    --self:moveTo(row, column)
    --self:add()
end

class('BuildingManager').extends(gfx.sprite)

local Buildings = {}

function BuildingManager:createUpgrade(column, type, cost, revenue, imagepath)
    self.gridview = pd.ui.gridview.new(128, 32)
    self.gridview:setNumberOfRows(8)
    self.gridview:setNumberOfColumns(1)
    self.gridview:setCellPadding(1, 1, 1, 1)
    local Building = Building(column, type, cost, revenue, imagepath)
    table.insert(Buildings, Building)
end

function BuildingManager:NavigateCells()
    if pd.buttonIsPressed(pd.kButtonUp) then
        self.gridview:selectPreviousRow(false)
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        self.gridview:selectNextRow(false)
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        self.gridview:selectPreviousColumn(false)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        self.gridview:selectNextColumn(false)
    end
end