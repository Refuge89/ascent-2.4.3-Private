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

function BGeddon_OnCombat(Unit,event)
	Unit:RegisterEvent("BGeddon_Inferno",math.random(10000,20000), 0)
	Unit:RegisterEvent("BGeddon_IgniteMana",math.random(10000,20000), 0)
	Unit:RegisterEvent("BGeddon_LivingBomb",math.random(30000,32000), 0)
	Unit:RegisterEvent("BGeddon_Amargeddon", 1000, 1)
end
function BGeddon_OnWipe(Unit,event)
	Unit:RemoveEvents()
end
function BGeddon_OnDied(Unit,event)
	Unit:RemoveEvents()
end
function BGeddon_Inferno(Unit)
	Unit:StopMovement(8000)
	Unit:FullCastSpell(19695)
end
function BGeddon_IgniteMana(Unit)
	Unit:CastSpell(19659)
end

function BGeddon_LivingBomb(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:FullCastSpellOnTarget(20475, plr)
	end
end
function BGeddon_Amargeddon(Unit,event)
	if Unit:GetHealthPct() == 2 then
		Unit:StopMovement(8000)
		Unit:FullCastSpell(20478)
	else
		Unit:RegisterEvent("BGeddon_Amargeddon", 5000, 1)
	end
end

RegisterUnitEvent(12056,1,"BGeddon_OnCombat")
RegisterUnitEvent(12056,2,"BGeddon_OnWipe")
RegisterUnitEvent(12056,4,"BGeddon_OnDied")