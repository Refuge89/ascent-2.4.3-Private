-- Guardian Kidlic 
-- encounter Script
-- by xenolf

phase = 0

function PhaseCheck(unit, event, miscunit, misc)
	if unit:GetHealthPct() <= 60 and phase == 0 then
		phase = 1
		unitRegisterEvent("GuardianKidlic_Phase1", 3000, 1)
	elseif unit:GetHealthPct() <= 40 and phase == 1 then
		phase = 2
		unit:RegisterEvent("GuardianKidlic_Phase2", 3000, 1)
	end
end

-- phase 1

function GuardianKidlic_MortalWound(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(28467, GetMainTank())
end

function GuardianKidlic_EnragingStrike(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(37974, GetClosestPlayer())
end

function GuardianKidlic_Phase1(unit, event, miscunit, misc)
	unit:RemoveEvents()
	unit:SendChatMessage(12, 0, "You wont succeed!")
	unit:RegisterEvent("PhaseCheck", 3000, 0)
	unit:RegisterEvent("GuardianKidlic_MortalWound", 8000, 0)
	unit:RegisterEvent("GuardianKidlic_EnragingStrike", 5000, 0)
end

-- phase 2

function GuardianKidlic_MightyBlow(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(43673, GetClosestPlayer())
	unit:ClearThreadList()
end

function GuardianKidlic_Phase2(unit, event, miscunit, misc)
	unit:RemoveEvents()
	unit:SendChatMessage(12, 0, "Lord! Give me strengh!")
	unit:RegisterEvent("GuardianKidlic_MortalWound", 8000, 0)
	unit:RegisterEvent("GuardianKidlic_EnragingStrike", 5000, 0)
	unit:RegisterEvent("GuardianKidlic_MightyBlow", 10000, 0)
end

function GuardianKidlic_OnEnterCombat(unit, event, miscunit, misc)
	unit:SendChatMessage(12, 0, "I will crush you!")
	unit:RegisterEvent("PhaseCheck", 3000, 0)
end

RegisterUnitEvent(230070, 1, "GuardianKidlic_OnEnterCombat")

function GuardianKidlic_OnWipe(unit, event, miscunit, misc)
	unit:RemoveEvents()
	unit:SendChatMessage(12, 0, "As i said...")
end

RegisterUnitEvent(230070, 2, "GuardianKidlic_OnWipe")

function GuardianKidlic_Kill(unit, event, miscunit, misc)
	unit:RemoveEvents()
	unit:SendChatMessage(12, 0, "Noooooo!")
end

RegisterUnitEvent(230070, 4, "GuardianKidlic_Kill")
