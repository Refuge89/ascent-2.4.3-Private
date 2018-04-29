--[[ BattleguardSartura.lua
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

function Sartura_Knockback(pUnit, event)
pUnit:CastSpellOnTarget(10689, pUnit:GetRandomPlayer(0))
kbtimer=math.random(25000, 60000)
pUnit:RegisterEvent("Sartura_Knockback2",kbtimer,1)
end

function Sartura_Knockback2(pUnit, event)
pUnit:CastSpellOnTarget(10689, pUnit:GetRandomPlayer(0))
kbtimer=math.random(25000, 60000)
pUnit:RegisterEvent("Sartura_Knockback",kbtimer,1)
end

function Sartura_Whirlwind(Unit)
Unit:CastSpell(46270)
end

function Sartura_Phase2(Unit, event)
if Unit:GetHealthPct() <20 then
Unit:RemoveEvents()
Unit:CastSpell(28747)
Unit:RegisterEvent("Sartura_Enrage",1000,0)
end
end

function Sartura_Enrage(Unit)
EnrageTimer = EnrageTimer + 1
if EnrageTimer==600 then
Unit:CastSpell(34624)
end
end

function Sartura_OnCombat(Unit, event)
EnrageTimer = 1
kbtimer=math.random(25000, 60000)
Unit:PlaySoundToSet(8646)
Unit:SendChatMessage(12, 0,"You will be judged for defiling these sacred grounds!")
Unit:RegisterEvent("Sartura_Whirlwind", 30000, 0)
Unit:RegisterEvent("Sartura_Phase2", 1000, 0)
Unit:RegisterEvent("Sartura_Knockback", kbtimer, 1)
Unit:RegisterEvent("Sartura_Enrage",1000,0)
end

function Sartura_OnLeaveCombat(Unit, event)
Unit:RemoveEvents()
end

function Sartura_OnKilledTarget(Unit, event)
Unit:PlaySoundToSet(8647)
Unit:SendChatMessage(12, 0,"I sentence you to death!")
end

function Sartura_OnDied(Unit, event)
Unit:PlaySoundToSet(8648)
Unit:SendChatMessage(12, 0,"I serve to the last!")
Unit:RemoveEvents()
end

RegisterUnitEvent(15516,1,"Sartura_OnCombat")
RegisterUnitEvent(15516,2,"Sartura_OnLeaveCombat")
RegisterUnitEvent(15516,3,"Sartura_OnKilledTarget")
RegisterUnitEvent(15516,4,"Sartura_OnDied")
