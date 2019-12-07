-----------------------------------------
-- ID: 5825
-- Item: Lucid Potion II
-- Item Effect: Restores 1000 HP
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
    local maxHP     = target:getMaxHP()
    local currentHP = target:getHP()
    local recoverHP = 1000
    local hpDiff    = maxHP - currentHP

    if recoverHP > hpDiff then
        hpAmount = hpDiff
    else
        hpAmount = recoverHP
    end
    target:addHP(hpAmount)
    target:messageBasic(dsp.msg.basic.RECOVERS_HP,0,hpAmount)
end