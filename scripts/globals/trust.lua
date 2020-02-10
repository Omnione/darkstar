---------------------------------------------------------
-- Trust
---------------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

dsp = dsp or {}
dsp.trust = dsp.trust or {}

dsp.trust.messageParty = function(mob, messageString)
    local party = {}
    local master = mob:getMaster()

    party = master:getAlliance()

    for _,member in ipairs(party) do
        if member:getZoneID() == mob:getZoneID() and member:isPC() then
            member:PrintToPlayer(messageString,4)
        end
    end
end