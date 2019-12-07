-----------------------------------------
-- ID: 5842
-- Item: Bottle of Ascetic's Gambir
-- Item Effect: Temporarily increases magic atk power and acc
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
    target:addStatusEffect(dsp.effect.MAGIC_ATK_BOOST, 50, 3, 300)
    target:addStatusEffect(dsp.effect.INTENSION, 100, 3, 300)
end