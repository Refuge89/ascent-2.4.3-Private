--[[ Brutallus.lua
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


--Brutallus by Project eXa and AntiWar

function Enrage(pUnit, Event)
pUnit:CastSpell(26662) --Berserk is the spell used by him.
end

function Stomp(pUnit, Event) --Nvm.
stomptarget=pUnit:GetMainTank();
pUnit:FullCastSpellOnTarget(45185, stomptarget)
stomptarget:RemoveAura(46394) --Removes the burn debuff.	
end

function Burn(pUnit, Event)
pUnit:CastSpellOnTarget(46394, pUnit:GetRandomPlayer(0))	
end

--function Meteor_Slash(pUnit, Event)
--pUnit:FullCastSpell(45150) --Commented out until someone tests to see if it splits the damage.
--end

function Combat_Talk(pUnit, Event)
Choice=math.random(1, 3)
if Choice==1 then
pUnit:SendChatMessage(12, 0, "Bring the fight to me!")
end	
if Choice==2 then
pUnit:SendChatMessage(12, 0, "Another day, another glorious battle!")
end
if Choice==3 then
pUnit:SendChatMessage(12, 0, "I live for this!")
end	
end

function Brut_OnCombat(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Ahh! More lambs to the slaughter!")
pUnit:RegisterEvent("Combat_Talk", 30000, 0)
--pUnit:RegisterEvent("Meteor_Slash", 60000, 0) --Commented out until someone tests to see if it splits the damage.
pUnit:RegisterEvent("Burn", 70000, 0)
pUnit:RegisterEvent("Stomp", 45000, 0) --Adjusted the timer to make a bit more sense.
pUnit:RegisterEvent("Enrage", 360000, 1)
end

function Brut_OnLeaveCombat(pUnit, Event)
pUnit:RemoveEvents()	
end

function Brut_OnKilledTarget (pUnit, Event)
Choice=math.random(1, 3)
if Choice==1 then
pUnit:SendChatMessage(12, 0, "Perish, insect!")	
elseif Choice==2 then
pUnit:SendChatMessage(12, 0, "You are meat!")
elseif Choice==3 then
pUnit:SendChatMessage(12, 0, "Too easy!")	
end
end

function Brut_OnDied(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Gah! Well done... Now... this gets... interesting... ")
pUnit:RemoveEvents()	
end

RegisterUnitEvent(24882, 1, "Brut_OnCombat")
RegisterUnitEvent(24882, 2, "Brut_OnLeaveCombat")
RegisterUnitEvent(24882, 3, "Brut_OnKilledTarget")
RegisterUnitEvent(24882, 4, "Brut_OnDied")

