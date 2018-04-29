function Sath_Curse(Unit, event, miscunit, misc)
	print "Sath Curse"
	Unit:FullCastSpellOnTarget(45032,Unit:GetClosestPlayer())
end

function Sath_Shadowbolt(Unit, event, miscunit, misc)
	print "Sath Shadowbolt"
	Unit:FullCastSpell(45031)
end

function Sath_Strike(Unit, event, miscunit, misc)
	print "Sath Strike"
        Unit:FullCastSpellOnTarget(45029,Unit:GetMainTank())
end

function Sath(unit, event, miscunit, misc)
	print "Sath"
	unit:RegisterEvent("Sath_Curse",9000,0)
	unit:RegisterEvent("Sath_Shadowbolt",13000,0)
	unit:RegisterEvent("Sath_Strike",21000,0)
end

function Sath_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

function Sath_Death(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24892,2, "Sath_OnLeaveCombat")
RegisterUnitEvent(24892,4, "Sath_Death")
RegisterUnitEvent(24892,1,"Sath")