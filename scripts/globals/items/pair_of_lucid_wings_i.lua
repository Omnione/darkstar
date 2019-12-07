-----------------------------------------
--	ID: 5834
--	Pair of Lucid Wings I
--	Grants 500 TP to all party members in range
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
-- TODO: AOE animation effect.

function onItemUse(target)
    local party = target:getParty()

    for _, member in pairs(party) do
        member:addTP(500)
    end
end