-----------------------------------------
-- ID: 5393
-- Item: Bottle of Monarch's Drink
-- Item Effect: Regain 30TP/sec 180
-- Duration 3 Mins
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
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
	if (not target:hasStatusEffect(dsp.effect.REGAIN)) then
		target:addStatusEffect(dsp.effect.REGAIN,3,3,180)
	else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end