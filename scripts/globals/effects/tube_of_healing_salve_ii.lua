-----------------------------------------
-- ID: 5836
-- Item: Tube of Healing Salve II
-- Item Effect: Restores 100% HP to Pet
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:hasPet() then
        result = dsp.msg.basic.REQUIRES_A_PET
    end
    if target:hasStatusEffect(dsp.effect.MEDICINE) then
        result = dsp.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return result
end

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local pet       = target:getPet()
    local hpAmount  = pet:getMaxHP() - pet:getHP()

    pet:addHP(hpAmount)
    pet:messageBasic(dsp.msg.basic.RECOVERS_HP,0,hpAmount)
end