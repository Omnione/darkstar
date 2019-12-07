-----------------------------------------
-- ID: 5832
-- Item: Flask of Healing Mist
-- Item Effect: Restores 600 HP AoE 10' radius
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
-- TODO: AOE animation effect.

function onItemUse(target)
    target:forMembersInRange(10, function(member)
        local hpAmount  = 0
        local maxHP     = member:getMaxHP()
        local currentHP = member:getHP()
        local recoverHP = 600
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