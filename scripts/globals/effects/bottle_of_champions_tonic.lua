-----------------------------------------
-- ID: 5843
-- Item: Bottle of Champion's Tonic
-- Item Effect: Temporarily increases potency
-- Duration: 60
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
    target:addStatusEffect(dsp.effect.POTENCY, 25, 3, 60)
end