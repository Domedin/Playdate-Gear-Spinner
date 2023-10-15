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
import "upgradeManager"

local pd <const> = playdate
local gfx <const> = playdate.graphics

Background(200, 120)
CreateScoreDisplay()
Gear(55, 55)

UpgradeManager:createUpgrade(284, 59, "gearSpeed", 10, 2, false, "images/upgradeIcon")
UpgradeManager:createUpgrade(317, 59, "gearSpeed", 10, 2, false, "images/upgradeIcon")
UpgradeManager:createUpgrade(350, 59, "gearSpeed", 10, 2, false, "images/upgradeIcon")
UpgradeManager:createUpgrade(383, 59, "gearSpeed", 10, 2, false, "images/upgradeIcon")
UpgradeManager:createUpgrade(284, 92, "gearSpeed", 10, 2, false, "images/upgradeIcon")
UpgradeManager:createUpgrade(317, 92, "gearSpeed", 10, 2, false, "images/upgradeIcon")
UpgradeManager:createUpgrade(350, 92, "gearSpeed", 10, 2, false, "images/upgradeIcon")
UpgradeManager:createUpgrade(383, 92, "gearSpeed", 10, 2, false, "images/upgradeIcon")

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end