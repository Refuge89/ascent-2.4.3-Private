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
	GARR's AI
	]]

RegisterUnitEvent(12057,1,"Garr_OnCombat")
RegisterUnitEvent(12057,2,"Garr_OnWipe")
RegisterUnitEvent(12057,4,"Garr_OnDied")

function Garr_OnCombat(Unit,event)
	setvars(Unit, {Garr = Unit})
	Unit:RegisterEvent("Garr_Shackles", 21000, 0)
	Unit:RegisterEvent("Garr_AntiMagicPulse", 10000, 0)
end

function Garr_OnWipe(Unit,event)
	Unit:RemoveEvents()
end
function Garr_OnDied(Unit,event)
	Unit:RemoveEvents()
end
function Garr_Shackles(Unit,event)
	Unit:CastSpell(19496)
end
function Garr_AntiMagicPulse(Unit,event)
	Unit:CastSpell(19492)
end
--[[
	FIRESWORM
	]]
RegisterUnitEvent(12099,1,"Firesworm_OnCombat")
RegisterUnitEvent(12099,2,"Firesworm_OnWipe")
RegisterUnitEvent(12099,4,"Firesworm_OnDied")

function Firesworm_OnCombat(Unit,event)
	Unit:RegisterEvent("FireswormSpells", math.random(14000, 20000), 0) --Only calling this once.
	Unit:RegisterEvent("Separation_Anxiety", 2000, 0)
end
function Firesworm_OnWipe(Unit,event)
	Unit:RemoveEvents()
end
function Firesworm_OnDied(Unit,event)
	Unit:RemoveEvents()
	Unit:CastSpell(19497)
end
function Separation_Anxiety(Unit,event)
	local args = getvars(Unit)
	if args.Garr ~= nil then
		local dist = Unit:GetDistance(args.Garr)
		if dist >= 70 then
			Unit:CastSpell(23492)
		end
	end
end

function FireswormSpells(Unit,event)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:FullCastSpellOnTarget(20294,plr)
	end
end
