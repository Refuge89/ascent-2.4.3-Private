--[[ arcanist_doan.lua
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
-- LUA++ staff, April 15, 2008. ]]
-- $author: Joel104
-- Spells:
-- ArcaneAOE 8439
-- Polymorph 13323 is buggy, I use 12826
-- Detonation 9435
-- Silence 8988
-- ArcaneBubble 9438

function DoanOnCombat(pUnit, Event)
    print "Doan fight start"
    pUnit:SendChatMessage(12, 0, "You will not defile these mysteries!")
    pUnit:PlaySoundToSet(5842)
    pUnit:RegisterEvent("DoanRndCast", 6000, 0)
end

function DoanRndCast(pUnit, Event)
    local rndcast = math.random(1,4)
	if (rndcast == 1) then
	pUnit:FullCastSpellOnTarget(8439, pUnit:GetRandomPlayer(0))
	elseif (rndcast == 2) then
	pUnit:FullCastSpellOnTarget(12826, pUnit:GetRandomPlayer(0)) -- (7)Not_Main_Tank crash the server
	elseif (rndcast == 3) then
	pUnit:FullCastSpellOnTarget(8988, pUnit:GetRandomPlayer(4))
	pUnit:RegisterEvent("DoanPhaseTwo", 500, 0)
end
   end
   
function DoanPhaseTwo(pUnit, Event)
   if (pUnit:GetHealthPct() < 50) then
   print "doan phase two start"
   pUnit:FullCastSpell(9438)
   pUnit:SendChatMessage(12, 0, "Burn in righteous fire!")
   pUnit:PlaySoundToSet(5843)
   pUnit:FullCastSpell(9435)
   pUnit:RemoveEvents()
   pUnit:RegisterEvent("DoanRndCast", 5000, 0)
end
   end

function DoanOnLeaveCombat(pUnit)
   print "doan players dead"
   pUnit:RemoveEvents()
end

function DoanOnDied(pUnit)
   print "doan dead"
   pUnit:RemoveEvents()
end

RegisterUnitEvent(6487, 5, "DoanRndCast")
RegisterUnitEvent(6487, 5, "DoanPhaseTwo")
RegisterUnitEvent(6487, 1, "DoanOnCombat")
RegisterUnitEvent(6487, 3, "DoanOnLeaveCombat")
RegisterUnitEvent(6487, 4, "DoanOnDied")   