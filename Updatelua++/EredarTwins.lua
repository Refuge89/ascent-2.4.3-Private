--[[ EredarTwins.lua
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

--Eredar Twins by Project eXa and AntiWar
--Lady Sacrolash
-- Shadow spawns not availible atm

function Shadow_Fury(pUnit, Event)
pUnit:CastSpell(45270)	
end

function Confounding_Blow(pUnit, Event)
pUnit:CastSpellOnTarget(45256, pUnitGetRandomTarget(0))	
end

function Shadow_Nova(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Shadow to the aid of fire!") 
pUnit:FullCastSpell(45329)	
end

function Dark_Strike(pUnit, Event)
pUnit:CastSpellOnTarget(45271, pUnit:GetRandomTarget(0))	
end

function Shadow_Blades(pUnit, Event)
pUnit:CastSpellOnTarget(45248, pUnit:GetMainTank())
pUnit:RegisterEvent(Dark_Strike,1000,1)
end

function Dark_Touched(pUnit, Event)
pUnit:CastSpellOnTarget(45347, pUnit:GetRandomTarget(0))	
end

function Lady_OnCombat(pUnit, Event)
pUnit:RegisterEvent("Confounding_Blow",30000,0)
pUnit:RegisterEvent("Shadow_Nova",35000,0)
pUnit:RegisterEvent("Shadow_Blades",15000,0)
pUnit:RegisterEvent("Dark_Touched",25000,0)
end

function Lady_OnLeaveCombat(pUnit, Event)
pUnit:RemoveEvents()	
end

function Lady_OnKilledTarget(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Shadows, engulf!")	
end

function Lady_OnDied(pUnit, Event)
pUnit:RemoveEvents()	
end

--Grand Warlock Alythess

function Flame_Sear(pUnit, Event)
pUnit:CastSpellOnTarget(46771, pUnit:GetRandomTarget(0))
pUnit:CastSpellOnTarget(46771, pUnit:GetRandomTarget(0))
pUnit:CastSpellOnTarget(46771, pUnit:GetRandomTarget(0))
end

function Conflagration(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Fire to the aid of shadow!")
pUnit:FullCastSpellOnTarget(45342, pUnit:GetMainTank())	
end

function Flame_Touched(pUnit, Event)
pUnit:CastSpellOnTarget(45348, pUnit:GetRandomTarget(0))	
end

function Pyrogenics(pUnit, Event)
pUnit:CastSpell(45230)	
end

function Warlock_OnCombat(pUnit, Event)
pUnit:RegisterEvent("Flame_Touched",15000,0)
pUnit:RegisterEvent("Pyrogenics",1000,1)
pUnit:RegisterEvent("Flame_Sear",20000,0)
pUnit:RegisterEvent("Conflagration",20000,0)
end

function Warlock_OnLeaveCombat(pUnit, Event)
pUnit:RemoveEvents()	
end

function Warlock_OnKilledTarget(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Fire, consume!")	
end

function Warlock_OnDied(pUnit, Event)
pUnit:RemoveEvents()	
end


RegisterUnitEvent(25165, 1, "Lady_OnCombat")
RegisterUnitEvent(25165, 2, "Lady_OnLeaveCombat")
RegisterUnitEvent(25165, 3, "Lady_OnKilledTarget")
RegisterUnitEvent(25165, 4, "Lady_OnDied")
RegisterUnitEvent(25166, 1, "Warlock_OnCombat")
RegisterUnitEvent(25166, 2, "Warlock_OnleaveCombat")
RegisterUnitEvent(25166, 3, "Warlock_OnKilledTarget")
RegisterUnitEvent(25166, 4, "Warlock_OnDied")