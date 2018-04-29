function Kael_Fireball(Unit, event, miscunit, misc)
	print "Kael Fireball"
	Unit:FullCastSpellOnTarget(44189,Unit:GetMainTank())
end

function Kael_Pheonix(Unit, event, miscunit, misc)
	print "Kael Pheonix"
	Unit:FullCastSpell(44194)
end

function Kael_Flame(Unit, event, miscunit, misc)
	print "Kael Flame"
	Unit:FullCastSpell(46162)
end

function Kael_Gravity(Unit, event, miscunit, misc)
	print "Kael Gravity"
	Unit:FullCastSpell(44224)
end

function Kael_Pyroblast(Unit, event, miscunit, misc)
	print "Kael Pyroblast"
	Unit:FullCastSpellOnTarget(36819,Unit:GetMainTank())
end

function Kael_Shock(Unit, event, miscunit, misc)
	print "Kael Shock"
	Unit:FullCastSpell(46165)
end

function Kael_Death(Unit, event, miscunit, misc)
	Unit:RemoveEvents()
end

function Kael_OnLeaveCombat(Unit, event, miscunit, misc)
	Unit:RemoveEvents()
end

function Kael(unit, event, miscunit, misc)
	print "Kael"
	unit:RegisterEvent("Kael_Fireball",15000,0)
	unit:RegisterEvent("Kael_Pheonix",40000,0)
	unit:RegisterEvent("Kael_Flame",60000,0)
	unit:RegisterEvent("Kael_Gravity",75000,0)
	unit:RegisterEvent("Kael_Pyroblast",25000,0)
	unit:RegisterEvent("Kael_Shock",20000,0)
end

RegisterUnitEvent(24664,4,"Kael_OnLeaveCombat")
RegisterUnitEvent(24664,4,"Kael_Death")
RegisterUnitEvent(24664,1,"Kael")
