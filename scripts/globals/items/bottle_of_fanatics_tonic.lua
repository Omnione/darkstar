-----------------------------------------
-- ID: 5845
-- Item: Bottle of Fanatic's Tonic
-- Item Effect: Temp nullifies 50% physical dmg
-- Duration: 60 secs
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(dsp.effect.MEDICINE) then
        result = 111
    end
    return result
end

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(dsp.effect.PHYSICAL_SHIELD, 1, 3, 60)
end
