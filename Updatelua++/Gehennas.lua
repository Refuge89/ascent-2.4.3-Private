--[[********************************
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
--[[
	GEHENNAS AI
	]]
function Gehennas_OnCombat(Unit,event)
	Unit:RegisterEvent("GehennasSpells", 10000, 0)
end
function Gehennas_OnDied(Unit,event)
	Unit:RemoveEvents()
end
function Gehennas_OnWipe(Unit,event)
	Unit:RemoveEvents()
end
	
function GehennasSpells(Unit,event)
	local rand = math.random(1,3)
	local plr = Unit:GetRandomPlayer(0)
	if rand == 1 and plr ~= nil then
		Unit:FullCastSpellOnTarget(19729,plr)
	elseif rand == 2 and plr ~= nil then
		Unit:CastAoF(plr:GetX(),plr:GetY(),plr:GetZ(),19717)
	elseif rand == 3 then
		Unit:CastSpell(19716)
	end
end

RegisterUnitEvent(12259,1,"Gehennas_OnCombat")
RegisterUnitEvent(12259,2,"Gehennas_OnWipe")
RegisterUnitEvent(12259,4,"Gehennas_OnDied")
--[[
	FLAMEWALKER's AI
	]]

function GehennasElites_OnCombat(Unit,event)
	local Gehennas = Unit:GetCreatureNearestCoords(Unit:GetX(),Unit:GetY(),Unit:GetZ(),12259)
	if Gehennas ~= nil then
		Unit:RegisterEvent("GehennasElitesSpells", 10000, 0)
	end
end
function GehennasElites_OnWipe(Unit,event)
	Unit:RemoveEvents()
end
function GehennasElites_OnDied(Unit,event)
	Unit:RemoveEvents()
end
function GehennasElitesSpells(Unit,event)
	local rand = math.random(1,3)
	local tank = Unit:GetMainTank()
	if rand == 1 then
		Unit:CastSpell(20277)
	elseif rand == 2 and tank ~= nil then
		Unit:CastSpellOnTarget(24317,tank)
	elseif rand == 3 and tank ~= nil then
		Unit:CastSpellOnTarget(19730,tank)
	end
end
	
RegisterUnitEvent(11664, 1, "GehennasElites_OnCombat")
RegisterUnitEvent(11664, 2, "GehennasElites_OnWipe")
RegisterUnitEvent(11664, 4, "GehennasElites_OnDied")