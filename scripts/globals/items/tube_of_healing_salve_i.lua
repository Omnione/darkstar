-----------------------------------------
-- ID: 5835
-- Item: Tube of Healing Salve I
-- Item Effect: Restores 50% HP to Pet
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
	local hpAmount  = 0
    local maxHP     = pet:getMaxHP()
    local currentHP = pet:getHP()
    local recoverHP = (maxHP/100)*50
    local hpDiff    = maxHP - currentHP

    if recoverHP > hpDiff then
        hpAmount = hpDiff
    else
        hpAmount = recoverHP
    end

    pet:addHP(hpAmount)

    pet:messageBasic(dsp.msg.basic.RECOVERS_HP,0,hpAmount)
end