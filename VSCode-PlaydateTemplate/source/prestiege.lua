local pd <const> = playdate
local gfx <const> = pd.graphics

--Creates the prestiege information
prestiegePoints = 0
totalPrestiegePoints = 0

--Creates the images of the prestiege button
prestiegeImage = gfx.image.new("Images/upgradeIcons/prestiegeIcon")
selectedPrestiegeImage = gfx.image.new("Images/upgradeIcons/SelectedPrestiegeIcon")

--Navigates the prestiege Cell
function NavigatePrestiegeCell(gridView)
    if pd.buttonJustPressed(pd.kButtonDown) then
        selectedGridView = 2
        PrestiegePointsSprite:setImage(nil)
        totalPrestiegePointsSprite:setImage(nil)
    end
end