-- Corelibs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"

-- Game
import "gear"
import "gearCount"
import "background"
import "buildingManager"
import "upgradeManager"

local pd <const> = playdate
local gfx <const> = playdate.graphics

Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)

local upgradeGridView = pd.ui.gridview.new(32, 32)

function NavigateCells()
    if pd.buttonIsPressed(pd.kButtonUp) then
        upgradeGridView:selectPreviousRow(false)
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        upgradeGridView:selectNextRow(false)
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        upgradeGridView:selectPreviousColumn(false)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        upgradeGridView:selectNextColumn(false)
    end
end

UpgradeManager:createUpgrades()

--[[
for i,upgrade in ipairs(Upgrades) do
    print(upgrade[1])
end

for i=1,20 do
    print(i)
end
]]
function upgradeGridView:drawCell(section, row, column, selected, x, y, width, height)
    --ROW ONE
    if column == 1 and row == 1 then
        if selected then
            Upgrades[1][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[1][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[1][5]:draw(x, y)
        end
    end
    if column == 2 and row == 1 then
        if selected then
            Upgrades[2][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[2][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[2][5]:draw(x, y)
        end
    end
    if column == 3 and row == 1 then
        if selected then
            Upgrades[3][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[3][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[3][5]:draw(x, y)
        end
    end
    if column == 4 and row == 1 then
        if selected then
            Upgrades[4][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[4][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[4][5]:draw(x, y)
        end
    end
    --ROW TWO
    if column == 1 and row == 2 then
        if selected then
            Upgrades[5][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[5][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[5][5]:draw(x, y)
        end
    end
    if column == 2 and row == 2 then
        if selected then
            Upgrades[6][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[6][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[6][5]:draw(x, y)
        end
    end
    if column == 3 and row == 2 then
        if selected then
            Upgrades[7][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[7][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[7][5]:draw(x, y)
        end
    end
    if column == 4 and row == 2 then
        if selected then
            Upgrades[8][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[8][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[8][5]:draw(x, y)
        end
    end
    --ROW THREE
    if column == 1 and row == 3 then
        if selected then
            Upgrades[9][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[9][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[9][5]:draw(x, y)
        end
    end
    if column == 2 and row == 3 then
        if selected then
            Upgrades[10][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[10][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[10][5]:draw(x, y)
        end
    end
    if column == 3 and row == 3 then
        if selected then
            Upgrades[11][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[11][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[11][5]:draw(x, y)
        end
    end
    if column == 4 and row == 3 then
        if selected then
            Upgrades[12][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[12][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[12][5]:draw(x, y)
        end
    end
    --ROW FOUR
    if column == 1 and row == 4 then
        if selected then
            Upgrades[13][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[13][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[13][5]:draw(x, y)
        end
    end
    if column == 2 and row == 4 then
        if selected then
            Upgrades[14][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[14][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[14][5]:draw(x, y)
        end
    end
    if column == 3 and row == 4 then
        if selected then
            Upgrades[15][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[15][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[15][5]:draw(x, y)
        end
    end
    if column == 4 and row == 4 then
        if selected then
            Upgrades[16][6]:draw(x, y)

            BackgroundReplace(197, 142)

            gearInfo = gfx.sprite.new()
            gearInfo:setCenter(0,0)
            gearInfo:moveTo(132, 43)
            gearInfo:add()

            local Text = Upgrades[16][2] .. " Upgrade"
            local textWidth, textHeight = gfx.getTextSize(Text)
            local TextImage = gfx.image.new(textWidth, textHeight)
            gfx.pushContext(TextImage)
                gfx.drawText(Text, 0, 0)
            gfx.popContext()
            gearInfo:setImage(TextImage)
        else
            Upgrades[16][5]:draw(x, y)
        end
    end
end

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()

    upgradeGridView:setNumberOfRows(4)
    upgradeGridView:setNumberOfColumns(4)
    upgradeGridView:setCellPadding(1, 1, 1, 1)
    NavigateCells()
    upgradeGridView:drawInRect(264, 42, 136, 68)
    
    --[[
    BuildingManager:NavigateCells()
    BuildingManager.gridview:drawInRect(267, 113, 136, 128)
    ]]
end

