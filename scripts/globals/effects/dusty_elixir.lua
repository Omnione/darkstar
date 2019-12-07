-----------------------------------------
-- ID: 5433
-- Item: Dusty Elixir
-- Item Effect: Instantly restores 25% of HP and MP
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:getMaxHP() == target:getHP() then
        result = 56 -- Does not let player use item if their hp is full
    end
    if target:hasStatusEffect(dsp.effect.MEDICINE) then
        result = 111
    end
    return result
end

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local hpAmount  = 0
    local mpAmount  = 0
    local maxHP     = target:getMaxHP()
    local maxMP     = target:getMaxMP()
    local currentHP = target:getHP()
    local currentMP = target:getMP()
    local recoverHP = (maxHP/100)*25
    local recoverMP = (maxMP/100)*25
    local hpDiff    = maxHP - currentHP
    local mpDiff    = maxMP - currentMP

    if recoverHP > hpDiff then
        hpAmount = hpDiff
    else
        hpAmount = recoverHP
    end
    if recoverMP > mpDiff then
        mpAmount = mpDiff
    else
        mpAmount = recoverMP
    end

    target:addHP(hpAmount)
    target:addMP(mpAmount)
	target:messageBasic(dsp.msg.basic.RECOVERS_HP_AND_MP)
end