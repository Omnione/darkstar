-----------------------------------------
-- ID: 5322
-- Item: Flask of Healing Powder
-- Item Effect: Restores 25% HP AoE 10' radius
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
-- TODO: AOE animation effect.

function onItemUse(target)
    target:forMembersInRange(10, function(member)
        local hpAmount  = 0
        local maxHP     = member:getMaxHP()
        local currentHP = member:getHP()
        local recoverHP = (maxHP/100)*25
        local hpDiff    = maxHP - currentHP

        if recoverHP > hpDiff then
            hpAmount = hpDiff
        else
            hpAmount = recoverHP
        end

        member:addHP(hpAmount)
        member:messageBasic(dsp.msg.basic.RECOVERS_HP,0,hpAmount)
    end)
end