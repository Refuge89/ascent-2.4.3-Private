--[[ UNIT_BlackTemple_Generic.lua
	 DBE Scripting
	 by xenolf        ]]
	 
-- Karabor Sewers
	 
function AqueousSpawn_Nova(unit, event, miscunit, misc)
	unit:FullCastSpell(40103)
end

function AqueousSpawn_Heal(unit, event, miscunit, misc)
	local heal = math.random(1, 10)
	if heal == 5 then
		local plr = unit:GetRandomFriend()
		if plr then
		unit:FullCastSpellOnTarget(38588, plr)
		end
	end
end

function AqueousSpawn_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("AqueousSpawn_Nova", 20000, 0)
	unit:RegisterEvent("AqueousSpawn_Heal", 15000, 0)
end

RegisterUnitEvent(230024, 1, "Aqueous_Combat")

function CoilskarSeaCaller_Hurricane(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40090, unit:GetRandomPlayer(0))
end

function CoilskarSeaCaller_ForkedLightning(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40088, unit:GetRandomPlayer(0))
end

function CoilskarSeaCaller_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("CoilskarSeaCaller_Hurricane", 18000, 0)
	unit:RegisterEvent("CoilskarSeaCaller_ForkedLightning", 10000, 0)
end

RegisterUnitEvent(230001, 1, "CoilskarSeaCaller_Combat")

function CoilskarWrangler_LightningProd(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40066, unit:GetRandomPlayer(0))
end

function CoilskarWrangler_Frenzy(unit, event, miscunit, misc)
	buff = math.random(1, 5)
	if buff == 2 then
	unit:FullCastSpellOnTarget(27995, unit:GetRandomFriend())
	end
end

function CoilskarWrangler_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("CoilskarWrangler_LightningProd", 10000, 0)
	unit:RegisterEvent("CoilskarWrangler_Frenzy", 6000, 0)
end

RegisterUnitEvent(230025, 1, "CoilskarWrangler_Combat")

function Leviathan_TailSwipe(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(35333, unit:GetClosestPlayer())
end

function Leviathan_PoisonSpit(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40078, unit:GetRandomPlayer(0))
end

function Leviathan_DebilitatingSpray(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40079, unit:GetRandomPlayer(0))
end

function Leviathan_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("Leviathan_TailSwipe", 15000, 0)
	unit:RegisterEvent("Leviathan_PoisonSpit", 9000, 0)
	unit:RegisterEvent("Leviathan_DebilitatingSpray", 12000, 0)
end

RegisterUnitEvent(230026, 1, "Leviathan_Combat")

function AuqeousLord_Summon(unit, event, miscunit, misc)
	x = unit:GetX()
	y = unit:GetY()
	z = unit:GetZ()
	o = unit:GetO()
	unit:SpawnCreature(22883, x, y, z, o, 14, 0)
	unit:SpawnCreature(22883, x ,y, z, o, 14, 0)
end

function AqueousLord_VileSlime(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40099, unit:GetRandomPlayer(0))
end

function AqueousLord_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("AqueousLord_Summon", 1000, 1)
	unit:RegisterEvent("AqueousLord_VileSlime", 8000, 0)
end

RegisterUnitEvent(230002, 1, "AqueousLord_Combat")

function CoilskarSoothsayer_HolyNova(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(38589, unit:GetClosestPlayer())
end

function CoilskarSoothsayer_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("CoilskarSoothsayer_HolyNova", 7000, 0)
end

RegisterUnitEvent(230031, 1, "CoilskarSoothsayer_Combat")

function CoilskarHarpooner_Throw(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40083, unit:GetRandomPlayer(0))
end

function CoilskarHarpooner_HookedNet(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40082, unit:GetRandomPlayer(0))
end

function CoilskarHarpooner_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("CoilskarHarpooner_Throw", 6000, 0)
	unit:RegisterEvent("CoilskarHarpooner_HookedNet", 8000, 0)
end

RegisterUnitEvent(230032, 1, "CoilskarHarpooner_Combat")

function DragonTurtle_WaterSpit(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40086, unit:GetClosestPlayer())
end

function DragonTurtle_Combar(unit, event, miscunit, misc)
	unit:RegisterEvent("DragonTurtle_WaterSpit", 9000, 0)
end
	
RegisterUnitEvent(230033, 1, "DragonTurtle_Combat")

-- Sanctuary of Shadow

function AshtongueBattlelord_Cleave(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(31043, unit:GetClosestPlayer())
end

function AshtongueBattlelord_ConcussiveThrow(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(41182, unit:GetClosestPlayer())
end

function AshtongueBattlelord_ConcussionBlow(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(22427, unit:GetClosestPlayer())
end

function AshtongueBattlelord_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("AshtongueBattlelord_Cleave", 9000, 0)
	unit:RegisterEvent("AshtongueBattlelord_ConcussiveThrow", 6000, 0)
	unit:RegisterEvent("AshtongueBattlelord_ConcussionBlow", 14000, 0)
end

RegisterUnitEvent(230011, 1, "AshtongueBattlelord_Combat")

function AshtongueFeralSpirit_Charge(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(38907, unit:GetRandomPlayer(0))
	unit:ClearThreadList()
end

function AshtongueFeralSpirit_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("AshtongueFeralSpirit_Charge", 10000, 0)
end

RegisterUnitEvent(230012, 1, "AshtongueFeralSpirit_Combat")

function AshtongueStormcaller_LightningShield(unit, event, miscunit, misc)
	unit:FullCastSpell(39067)
end

function AshtongueStormcaller_LightningBolt(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(42024, unit:GetRandomPlayer(0))
end

function AshtongueStormcaller_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("AshtongueStormcaller_LightningShield", 4000, 0)
	unit:RegisterEvent("AshtongueStormcaller_LightningBolt", 8000, 0)
end

RegisterUnitEvent(230013, 1, "AshtongueStormcaller_Combat")

function AshtonguePrimalist_WingClip(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(39584, unit:GetClosestPlayer())
end

function AshtonguePrimalist_Cyclone(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(39594, unit:GetRandomPlayer(0))
end

function AshtonguePrimalist_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("AshtonguePrimalist_WingClip", 7000, 0)
	unit:RegisterEvent("AshtonguePrimalist_Cyclone", 10000, 0)
end

RegisterUnitEvent(230014, 1, "AshtonguePrimalist_Combat")

function AshtongueMystic_Flameshock(unit, event, miscunit, misc)
	DidIt = 0
	flag = math.random (1, 2)
	if flag == 1 and DidIt == 0 then
	unit:FullCastSpellOnTarget(39590, unit:GetRandomPlayer(0))
	DidIt = 1
	end
end

function AshtongueMystic_FrostShock(unit, event, miscunit, misc)
	if flag == 2 and DidIt == 1 then
	unit:FullCastSpellOnTarget(41116, unit:GetRandomPlayer(0))
	end
end

function AshtongueMystic_Bloodlust(unit, event, miscunit, misc)
	unit:FullCastSpell(41185)
end

function AshtongueMystic_Cyclone(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(39594, unit:GetRandomPlayer(0))
end

function AshtongueMystic_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("AshtongueMystic_Flameshock", 5000, 0)
	unit:RegisterEvent("AshtongueMystic_FrostShock", 5000, 0)
	unit:RegisterEvent("AshtongueMystic_Bloodlust", 30000, 0)
	unit:RegisterEvent("AshtongueMystic_Cyclone", 10000, 0)
end

RegisterUnitEvent(230015, 1, "AshtongueMystic_Combat")

function IllidariDefiler_RainOfChaos(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40946, unit:GetRandomPlayer(0))
end

function IllidariDefiler_Banish(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40370, unit:GetRandomPlayer(0))
end

function IllidariDefiler_CurseOfAgony(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(39672, unit:GetRandomPlayer(0))
end

function IllidariDefiler_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("IllidariDefiler_RainOfChaos", 10000, 0)
	unit:RegisterEvent("IllidariDefiler_Banish", 15000, 0)
	unit:RegisterEvent("IllidariDefiler_CurseOfAgony", 6000, 0)
end

RegisterUnitEvent(230016, 1, "IllidariDefiler_Combat")

function IllidariCenturion_Cleave(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(31043, unit:GetClosestPlayer())
end

function IllidariCenturion_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("IllidariCenturion_Cleave", 5000, 0)
end

RegisterUnitEvent(230003, 1, "IllidariCenturion_Combat")

function IllidariBoneslicer_Gouge(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(28456, unit:GetMainTank())
	unit:ClearThreadList()
end

function IllidariBonesclicer_WoundPoison(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(39665, unit:GetMainTank())
end

function IllidariBoneslicer_CloakOfShadows(unit, event, miscunit, misc)
	unit:FullCastSpell(39666)
end

function IllidariBoneslicer_Blind(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(43433, unit:GetRandomPlayer(0))
end

function IllidariBoneslicer_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("IllidariBoneslicer_Gouge", 10000, 0)
	unit:RegisterEvent("IllidariBoneslicer_WoundPoison", 7000, 0)
	unit:RegisterEvent("IllidariBoneslicer_CloakOfShadows", 13000, 0)
	unit:RegisterEvent("IllidariBoneslicer_Blind", 9000, 0)
end

RegisterUnitEvent(230004, 1, "IllidariBoneslicer_Combat")

function IllidariHeartseeker_RapidShot(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(41172, unit:GetRandomPlayer(0))
end

function IllidariHeartseeker_SonicShot(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(41084, unit:GetRandomPlayer(0))
end

function IllidariHeartseeker_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("IllidariHeartseeker_RapidShot", 3000, 0)
	unit:RegisterEvent("IllidariHeartseeker_SonicShot", 5000, 0)
end

RegisterUnitEvent(230005, 1, "IllidariHeartseeker_Combat")

function IllidariNightlord_Hellfire(unit, event, miscunit, misc)
	unit:FullCastSpell(39132)
end

function IllidariNightlord_Fear(unit, event, miscunit, misc)
	unit:FullCastSpell(33547)
end

function IllidariNightlord_Shadowfiends(unit, event, miscunit, misc)
	x = unit:GetX()
	y = unit:GetY()
	z = unit:GetZ()
	o = unit:GetO()
	unit:SpawnCreature(22929, x, y, z, o, 14, 0)
	unit:SpawnCreature(22929, x+3, y+3, z, o, 14, 0)
	unit:SpawnCreature(22929, x+5, y, z, o, 14, 0)
	unit:SpawnCreature(22929, x, y+5, z, o, 14, 0)
	unit:SpawnCreature(22929, x+7, y, z, o, 14, 0)
	unit:SpawnCreature(22929, x, y+7, z, o, 14, 0)
	unit:SpawnCreature(22929, x+1, y, z, o, 14, 0)
	unit:SpawnCreature(22929, x, y+6, z, o, 14, 0)
	unit:SpawnCreature(22929, x+4, y, z, o, 14, 0)
	unit:SpawnCreature(22929, x, y+8, z, o, 14, 0)
end

function IllidariNightlord_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("IllidariNightlord_Hellfire", 10000, 0)
	unit:RegisterEvent("IllidariNightlord_Fear", 6000, 0)
	unit:RegisterEvent("IllidariNightlord_Shadowfiends", 1000, 1)
end

RegisterUnitEvent(230006, 1, "IllidariNightlord_Combat")

-- Gorefiends Vigil

function ShadowmoonChampion_Whirlwind(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40236, unit:GetClosestPlayer())
end

function ShadowmoonChampion_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("ShadowmoonChampion_Whirlwind", 5000, 0)
end

RegisterUnitEvent(230021, 1, "ShadowmoonChampion_Combat")

function ShadowmoonRidinghound_Charge(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(38907, unit:GetRandomPlayer(0))
	unit:ClearThreadList()
end

function ShadowmoonRidinghound_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("ShadowmoonRidinghoun_Charge", 8000, 0)
end

RegisterUnitEvent(230022, 1, "ShadowmoonRidinghound_Combat")

function ShadowmoonDeathshaper_RaiseDead(unit, event, miscunit, misc)
	x = unit:GetX()
	y = unit:GetY()
	z = unit:GetZ()
	o = unit:GetO()
	unit:SpawnCreature(23371, x, y, z, o, 14, 0)
end

function ShadowmoonDeathshaper_Dreadbolt(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(40876, unit:GetRandomPlayer(0))
end

function ShadowmoonDeathshaper_DeathCoil(unit, event, miscunit, misc)
	unit:FullCastSpellOnTarget(33130, unit:GetRandomPlayer(0))
end

function ShadowmoonDeathshaper_Combat(unit, event, miscunit, misc)
	unit:RegisterEvent("ShadowmoonDeathshaper_RaiseDead", 4000, 0)
	unit:RegisterEvent("ShadowmoonDeathshaper_Dreadbolt", 6000, 0)
	unit:RegisterEvent("ShadowmoonDeathshaper_DeathCoil", 5000, 0)
end

RegisterUnitEvent(230023, 1, "ShadowmoonDeathshaper_Combat")
