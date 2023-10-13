-- Corelibs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Game
import "gear"
import "gearCount"
import "upgrade"

local pd <const> = playdate
local gfx <const> = playdate.graphics

upgrade(200, 200)
CreateScoreDisplay()
Gear(55, 55)

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end