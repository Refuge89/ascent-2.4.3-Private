function Kilrek_AmpFlames(Unit, event, miscunit, misc)
	Unit:FullCastSpellOnTarget(30053,Unit:GetClosestPlayer())
end

function Kilrek(unit, event, miscunit, misc)
	unit:RegisterEvent("Kilrek_AmpFlames", 8000, 0)
end

RegisterUnitEvent(17229, 1, "Kilrek")

function Kilrek_Dies(unit, event)
     BrokenPact=1; --Once you make the AI for illhoof, make it all in one script, and run a check every second that checks if BrokenPact == 1 then unit:CastSpell(30065). This will make illhoof cast broken pact on himself when kilrek dies, and that's how it is on retail.
     unit:RemoveEvents()
end

RegisterUnitEvent(17229, 4, "Kilrek_Dies")

function Kilrek_OnWipe(unit, event)
     unit:RemoveEvents()
end

RegisterUnitEvent(17229, 2, "Kilrek_OnWipe")
