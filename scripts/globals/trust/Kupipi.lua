-----------------------------------
-- Trust: Kupipi
-- Spellid: 898
-----------------------------------
require("scripts/globals/trust")
-----------------------------------

function onMobSpawn(mob)
    --local party = {}
    local master = mob:getMaster()
    local text = "You can entrust e~verything to the meticulous Kupipi!"

    --party = master:getAlliance()
    master:PrintToPlayer(text,15)
    --for _,member in ipairs(party) do
    --    if member:getZoneID() == mob:getZoneID() and member:isPC() then
    --       member:PrintToPlayer(text,4)
    --    end
    --end
end

function onMobFight(mob,target)
    local master = mob:getMaster()

    if master:getHPP() < 50 then
        print("my masters hp is low")
        mob:castSpell(1,master)
    end
end

function onMobDeath(mob, player, isKiller)

end

function onMobDespawn(mob)

end

local function messageParty(mob, messageString)
end