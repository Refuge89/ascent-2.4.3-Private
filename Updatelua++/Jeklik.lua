--[[ HighPriestessJeklik.lua
********************************
*                                                            *
* The LUA++ Scripting Project        *
*                                                            *
********************************

This software is provided as free and open source by the
staff of The LUA++ Scripting Project, in accordance with 
the AGPL license. This means we provide the software we have 
created freely and it has been thoroughly tested to work for 
the developers, but NO GUARANTEE is made it will work for you 
as well. Please give credit where credit is due, if modifying,
redistributing and/or using this software. Thank you.

~~End of License Agreement
-- LUA++ staff, March 26, 2008. ]]

--High Priestess Jeklik by Project eXa
--Jeklik begins the encounter in bat form. In this form she has an AoE silence that also damages. 
--She randomly charges people in the group, and summons 6-8 bloodseeker bats once per minute. 
--When she drops below 50% HP, she reverts to priest form. 
--Here she casts Shadow Word: Pain, Mind Flay, Chain Mind Flay and Greater Heal. 
--She also summons bomb bats which drop fire bombs on the ground which AoE DoT those inside. 

function JeklikBat_Spawns(Unit, event)
x = Unit:GetX() + math.random(1,5)
y = Unit:GetY() + math.random(1,5)
z = Unit:GetZ() + math.random(1,5)
Unit:SpawnCreature(BATID, x, y, z, o, 0)
end

function JeklikBat_Summon(Unit, event)
Spawns = math.random(6,8)
Unit:SendChatMessage(12,0,"Lord Hir'eek, grant me wings of vengeance!")
Unit:RegisterEvent("JeklikBat_Spawns",1,Spawns)
end

function Jeklik_Phase2(Unit, event)
if Unit:GetHealthPct() < 50 then
Unit:SetModel(PRIESTMODEL)
end
end

function Jeklik_Silence(pUnit, event)
pUnit:CastSpell(24687)
JSTimer = math.random(15000,35000)
Unit:RegisterEvent("Jeklik_Silence2",JSTimer,1)
end

function Jeklik_Silence2(pUnit, event)
pUnit:CastSpell(24687)
JSTimer = math.random(15000,35000)
Unit:RegisterEvent("Jeklik_Silence",JSTimer,1)
end


function Jeklik_OnCombat(Unit, event)
JSTimer = math.random(15000,35000)
Unit:RegisterEvent("JeklikBat_Summon", 60000, 0)
Unit:RegisterEvent("Jeklik_Phase2",1000,0)
Unit:RegisterEvent("Jeklik_Silence",JSTimer,1)
end

function Jeklik_OnLeaveCombat(Unit, event)
Unit:SetModel(BATMODEL)
end

function Jeklik_OnKilledTarget(Unit)
end

function Jeklik_OnDied(Unit)
Unit:SendChatMessage(12,0,"Finally...death! Curse you, Hakkar! Curse you! ")
end



RegisterUnitEvent(JEKLIKID,1,"Jeklik_OnCombat")
RegisterUnitEvent(JEKLIKID,2,"Jeklik_OnLeaveCombat")
RegisterUnitEvent(JEKLIKID,3,"Jeklik_OnKilledTarget")
RegisterUnitEvent(JEKLIKID,4,"Jeklik_OnDied")
