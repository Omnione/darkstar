-----------------------------------------
-- ID: 5395
-- Item: Bottle of Cleric's Drink
-- Item Effect: Removes most status ailments AoE
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

function onItemUse(target)
    target:forMembersInRange(10, function(member)
        local removables =
        {
            dsp.effect.SILENCE,
            dsp.effect.BLINDNESS,
            dsp.effect.POISON,
            dsp.effect.PARALYSIS,
            dsp.effect.DISEASE,
            dsp.effect.PETRIFICATION,
            dsp.effect.BIND,
            dsp.effect.WEIGHT,
            dsp.effect.SLOW,
            dsp.effect.GRADUAL_PETRIFICATION,
            dsp.effect.ADDLE,
            dsp.effect.MUTE,
            dsp.effect.BANE,
            dsp.effect.PLAGUE,
            dsp.effect.BURN,
            dsp.effect.FROST,
            dsp.effect.CHOKE,
            dsp.effect.RASP,
            dsp.effect.SHOCK,
            dsp.effect.DROWN,
            dsp.effect.DIA,
            dsp.effect.BIO,
            dsp.effect.STR_DOWN,
            dsp.effect.DEX_DOWN,
            dsp.effect.VIT_DOWN,
            dsp.effect.AGI_DOWN,
            dsp.effect.INT_DOWN,
            dsp.effect.MND_DOWN,
            dsp.effect.CHR_DOWN,
            dsp.effect.MAX_HP_DOWN,
            dsp.effect.MAX_MP_DOWN,
            dsp.effect.ACCURACY_DOWN,
            dsp.effect.ATTACK_DOWN,
            dsp.effect.EVASION_DOWN,
            dsp.effect.DEFENSE_DOWN,
            dsp.effect.FLASH,
            dsp.effect.MAGIC_DEF_DOWN,
            dsp.effect.MAGIC_ACC_DOWN,
            dsp.effect.MAGIC_ATK_DOWN,
            dsp.effect.MAX_TP_DOWN,
            dsp.effect.ATTACK_DOWN_II,
            dsp.effect.DEFENSE_DOWN_II,
            dsp.effect.MAGIC_ATK_DOWN_II,
            dsp.effect.MAGIC_DEF_DOWN_II,
            dsp.effect.ACCURACY_DOWN_II,
            dsp.effect.EVASION_DOWN_II,
            dsp.effect.MAGIC_ACC_DOWN_II,
            dsp.effect.MAGIC_EVASION_DOWN_II,
            dsp.effect.SLOW_II,
            dsp.effect.PARALYSIS_II,
            dsp.effect.WEIGHT_II,
        }

        for i, effect in ipairs(removables) do
            if member:hasStatusEffect(effect) then
                member:delStatusEffect(effect)
            end
        end
    end)
end