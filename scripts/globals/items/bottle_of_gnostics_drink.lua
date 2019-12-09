-----------------------------------------
-- ID: 5394
-- Item: Bottle of Gnostic's Drink
-- Item Effect: Pax (Enmity Down)
-- Duration: 3 Mins
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0
end

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if not target:hasStatusEffect(dsp.effect.PAX) then
        target:addStatusEffect(dsp.effect.PAX,1,3,60)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end