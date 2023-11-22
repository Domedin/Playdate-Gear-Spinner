local pd <const> = playdate
local gfx <const> = pd.graphics

--Creates the prestiege information
prestiegePoints = 0
totalPrestiegePoints = 0

prestiegeImage = gfx.image.new("Images/upgradeIcons/prestiegeIcon")
selectedPrestiegeImage = gfx.image.new("Images/upgradeIcons/SelectedPrestiegeIcon")

function NavigatePrestiegeCells(gridView)
    if pd.buttonJustPressed(pd.kButtonDown) then
        selectedGridView = 2
        PrestiegePointsSprite:setImage(nil)
        totalPrestiegePointsSprite:setImage(nil)
    end
end