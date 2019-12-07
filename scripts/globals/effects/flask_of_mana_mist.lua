-----------------------------------------
-- ID: 5833
-- Item: Flask of Mana Mist
-- Item Effect: Restores 300 MP AoE 10' radius
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
        local mpAmount  = 0
        local maxMP     = member:getMaxMP()
        local currentMP = member:getMP()
        local recoverMP = 300
        local mpDiff    = maxMP - currentMP

        if recoverMP > mpDiff then
            mpAmount = mpDiff
        else
            mpAmount = recoverMP
        end

        member:addMP(mpAmount)
        member:messageBasic(dsp.msg.basic.RECOVERS_MP,0,mpAmount)
    end)
end