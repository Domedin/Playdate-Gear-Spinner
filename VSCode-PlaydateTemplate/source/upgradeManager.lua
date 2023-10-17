local pd <const> = playdate
local gfx <const> = pd.graphics

class('Upgrade').extends(gfx.sprite)

function Upgrade:init(row, column, type, cost, multiplier, pressed, imagepath)
    self.row = row
    self.column = column
    self.multiplier = multiplier
    self.pressed = pressed
    self.type = type
    self.image = gfx.image.new(imagepath)
    self.cost = cost

    --self:setImage(self.image)
    --self:moveTo(row, column)
    --self:add()
end

class('UpgradeManager').extends(gfx.sprite)

local upgrades = {}

local gridview = pd.ui.gridview.new(32, 32)

function UpgradeManager:createUpgrade(row, column, type, cost, multiplier, pressed, imagepath)
    gridview:setNumberOfRows(16)
    gridview:setNumberOfColumns(4)
    gridview:setCellPadding(1, 1, 1, 1)
    local upgrade = Upgrade(row, column, type, cost, multiplier, pressed, imagepath)
    table.insert(upgrades, upgrade)
end

function gridview:drawCell(section, row, column, selected, x, y, width, height)
    imagepath:draw(x, y)
end

function UpgradeManager:NavigateCells()
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