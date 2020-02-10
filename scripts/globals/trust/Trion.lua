-----------------------------------
-- Trust: Tion
-- Spellid: 905
-----------------------------------
require("scripts/globals/trust")
-----------------------------------

function onMobSpawn(mob)
    --local party = {}
    print("working")
    local master = mob:getMaster()
    local text = "I am Trion, prince of San d'Oria. May my blade lead us to victory this day!"

    --party = master:getAlliance()
    master:PrintToPlayer(text,15)
    --for _,member in ipairs(party) do
    --    if member:getZoneID() == mob:getZoneID() and member:isPC() then
    --       member:PrintToPlayer(text,4)
    --    end
    --end
end

function onMobFight(mob,target)
end

function onMobDeath(mob, player, isKiller)
    print("Trying to kill Trion!")
 end

function onMobDespawn(mob)
    print("Trying to despawn Trion!")
end

function onMonsterMagicPrepare(mob,target)
    -- casts Water IV, Waterga III, Flood, Drown
    local rnd = math.random();

    if rnd < 0.5 then
        return 43
    elseif rnd < 0.7 then
        return 1
    elseif rnd < 0.9 then
        return 48
    else
        return 1
    end

end

local function messageParty(mob, messageString)
    print("passing through to messageParty ok!")
end