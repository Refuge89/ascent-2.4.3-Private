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
function Gahz_Frostbreath(pUnit, event)
     print "Gahz_Frostbreath initiated..."
     pUnit:FullCastSpell(16099)
     pUnit:RegisterEvent("Gahz_Frostbreath", math.random(22000, 26000), 0)
end

function Gahz_Slam(pUnit, event)
     print "Gahz_Slam initiated..."
     pUnit:FullCastSpell(24326)
end

function Gahz_OnEnterCombat(pUnit, event)
     print "Gahz_Aggro initiated..."
     pUnit:RegisterEvent("Gahz_Frostbreath", math.random(14000, 18000), 1)
     pUnit:RegisterEvent("Gahz_Slam", 23000, 0)
end

RegisterUnitEvent(15114, 1, "Gahz_OnEnterCombat")

function Gahz_OnWipe(pUnit, event)
     print "Gahz_Wipe initiated..."
     pUnit:RemoveEvents()
end

RegisterUnitEvent(15114, 2, "Gahz_OnWipe")

function Gahz_OnDie(pUnit, event)
     print "Gahz_Dies initiated..."
     pUnit:RemoveEvents()
end

RegisterUnitEvent(15114, 4, "Gahz_OnDie")