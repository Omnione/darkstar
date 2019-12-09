-----------------------------------------
-- ID: 5840
-- Item: Bottle of Stalwart's Gambir
-- Item Effect: Temporarily increases atk power and acc
-----------------------------------------
require("scripts/globals/status")
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
    target:addStatusEffect(dsp.effect.ATTACK_BOOST, 50, 3, 300)
    target:addStatusEffect(dsp.effect.ACCURACY_BOOST, 100, 3, 300)
end