-----------------------------------------
-- Trust: Ingrid
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUseMisc(dsp.zoneMisc.PET)) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    elseif (not caster:canCastTrust(spell:getID())) then
        return
    end
    return 0
end

function onSpellCast(caster,target,spell)
    caster:spawnTrust(921)
    return 0
end
