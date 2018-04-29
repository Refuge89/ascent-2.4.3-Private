--Gauntlet Event--

function Lookout_OnCombat(Unit, event)
	Lookout = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 24175)
	Lookout:RemoveEvents()
	Lookout:SetCombatMeleeCapable(1)
	Lookout:SetFieldFlags(2)
	Lookout:RegisterEvent("Waypoint1", 200, 1)
end

function LookW1(Unit, event)
	Lookout:MoveToWaypoint(1)
	local result = Lookout:IsMoving()
	if(result == false) and (w1 == 1) then
	w2 = 1
	w1 = 0
	Lookout:RegisterEvent("LookW2", 100, 1)
	else
	Lookout:RegisterEvent("LookW1", 100, 1)
	end
end
function LookW2(Unit, event)
	Lookout:MoveToWaypoint(2)
	local result = Lookout:IsMoving()
	if(result == false) and (w2 == 1) then
	Lookout:RegisterEvent("LookW3", 100, 1)
	w3 = 1
	w2 = 0
	else
	Lookout:RegisterEvent("LookW2", 100, 1)
	end
end
function LookW3(Unit, event)
	Lookout:MoveToWaypoint(3)
	local result = Lookout:IsMoving()
	if(result == false) and (w3 == 1) then
	Lookout:RegisterEvent("LookW4", 100, 1)
	w4 = 1
	w3 = 0
	else
	Lookout:RegisterEvent("LookW3", 100, 1)
	end
end
function LookW4(Unit, event)
	Lookout:MoveToWaypoint(4)
	local result = Lookout:IsMoving()
	if(result == false) and (w4 == 1) then
	Lookout:RegisterEvent("LookW5", 100, 1)
	w5 = 1
	w4 = 0
	else
	Lookout:RegisterEvent("LookW4", 100, 1)
	end
end

function LookW5(Unit, event)
	Lookout:MoveToWaypoint(4)
	local result = Lookout:IsMoving()
	if(result == false) and (w5 == 1) then
	w6 = 1
	w5 = 0
	Lookout:RegisterEvent("LookW6", 100, 0)
	else
	Lookout:RegisterEvent("LookW5", 100, 1)
	end
end
function LookW6(Unit, event)
	Lookout:MoveToWaypoint(5)
	local result = Lookout:IsMoving()
	if(result == false) and (w6 ==1) then
	w6 = 0
	Lookout:RegisterEvent("DestroyWP", 5000, 1)
	else
	Lookout:RegisterEvent("LookW6", 500, 1)
	end
end

function DestroyWP(Unit, event)
if(result == false) then
	Lookout:DestroyCustomWaypointMap()
	else
	end
end
function firstismovingcheck(Unit, event)
local result = Lookout:IsMoving()
if (result == false) then
	Lookout:RegisterEvent("LookW1", 100, 1)
	else
	Lookout:RegisterEvent("firstismovingcheck", 100, 1)
	end
end

function Waypoint1(Unit, event)
	Lookout:CreateCustomWaypointMap()
    Lookout:CreateWaypoint(229.034607, 1468.416260, 25.916971, 4.691184, 0, 256, 0)
	Lookout:CreateWaypoint(228.258881, 1433.437134, 27.247080, 1.549781, 0, 256, 0)
	Lookout:CreateWaypoint(230.087448, 1367.468384, 48.110592, 0.308661, 0, 256, 0)
	Lookout:CreateWaypoint(284.288188, 1378.752686, 49.321762, 3.446516, 0, 256, 0)
	Lookout:CreateWaypoint(300.646362, 1384.543945, 57.763447, 5.975498, 0, 256, 0)
	Lookout:CreateWaypoint(369.476929, 1405.172852, 74.774590, 0.265464, 0, 256, 0)
	Lookout:CreateWaypoint(370.347321, 1404.670044, 74.777657, 0.273482, 0, 256, 0)
	Lookout:MoveToWaypoint(0)
	Lookout:ModifySpeed(20)
	w1 = 1
	Lookout:RegisterEvent("Wave1", 5000, 1)
	Lookout:RegisterEvent("TempestDeathCheck", 5000, 0)
	Lookout:RegisterEvent("firstismovingcheck", 1000, 1)
end

function TempestDeathCheck(Unit, event)
	if Tempest == 1 then
	Lookout:RemoveEvents()
	Lookout:Despawn(1, 1800000)
	else
	end
end
function SpawnWarrior(Unit, event)
	local rand = math.random(1,2)
	Lookout:SpawnCreature(24225, 227.860931+rand, 1486.371826+rand, 25.916813, 4.761088, 1890, 0)
end
function SpawnEagle(Unit, event)
	local rand = math.random(1,2)
	Lookout:SpawnCreature(24159, 313.129028+rand, 1386.663330+rand, 57.163906, 3.434736, 1890, 0)
end

function Wave1(Unit, event)
   Lookout:RegisterEvent("SpawnWarrior", 10, 2)
   Lookout:RegisterEvent("SpawnEagle", 10, 5)
   Lookout:RegisterEvent("Wave2", 10000, 1)
end

function Wave2(Unit, event)
	Lookout:RegisterEvent("SpawnEagle", 50, 5)   		
	Lookout:RegisterEvent("Wave1", 20000, 1)
end
function WarOnSpawn(Unit, event)
	Unit:RegisterEvent("WarMoveTo", 500, 1)
end

function WarMoveTo(Unit, event)
	local randvalue = math.random(1,3)
	Unit:CreateCustomWaypointMap()
	Unit:CreateWaypoint(228.258881+randvalue, 1433.437134+randvalue, 27.247080, 1.549781, 0, 256, 0)
	Unit:CreateWaypoint(230.087448+randvalue, 1367.468384+randvalue, 48.110592, 0.308661, 0, 256, 0)
	Unit:MoveToWaypoint(0)
	Unit:RegisterEvent("Warriorwpcheck", 50,1)
end
function Warriorwpcheck(Unit, event)
	local result = Unit:IsMoving()
	if(result == false) then
	Unit:MoveToWaypoint(1)
	else
	Unit:RegisterEvent("Warriorwpcheck", 500, 1)
	end
end

function EaglesOnSpawn(Unit, event)
	Unit:RegisterEvent("EagleWaypoint", 2000, 1)
end

function EagleWaypoint(Unit, event)
	local randvalue = math.random(1,3)
	Unit:CreateCustomWaypointMap()
	Unit:CreateWaypoint(302.160675, 1385.863525, 57.465481, 3.486127, 0, 768, 0)
	Unit:CreateWaypoint(283.535461, 1380.061768, 49.321793, 3.411514, 0, 768, 0)
	Unit:CreateWaypoint(229.894531, 1382.951660, 44.680309, 2.724290, 0, 768, 0)
	Unit:CreateWaypoint(227.885117, 1423.646851, 30.273218, 1.587819, 0, 768, 0)
	Unit:MoveToWaypoint(0)
	e1 = 1
	Unit:RegisterEvent("Eaglewpcheck", 500,1 )
end
function Eaglewpcheck(Unit, event)
	local result = Unit:IsMoving()
	if(result == false) and (e1 == 1) then
	Unit:RegisterEvent("eagle1", 10, 1)
	else
	Unit:RegisterEvent("Eaglewpcheck", 10,1 )
	end
end

function eagle1(Unit, event)
	Unit:MoveToWaypoint(1)
	local result = Unit:IsMoving()
	if(result == false) and (e1 == 1) then
	e2 = 1
	e1 = 0
	Unit:RegisterEvent("eagle2", 10, 1)
	else
	Unit:RegisterEvent("eagle1", 10, 1)
	end
end
function eagle2(Unit, event)
	Unit:MoveToWaypoint(2)
	local result = Unit:IsMoving()
	if(result == false) and (e2 == 1) then
	e3 = 1
	e2 = 0
	Unit:RegisterEvent("eagle3", 10, 1)
	else
	Unit:RegisterEvent("eagle2", 10, 1)
	end
end

function eagle3(Unit, event)
	Unit:MoveToWaypoint(3)
	local result = Unit:IsMoving()
	if(result == false) and (e3 == 1) then
	e3 = 0
	else
	Unit:RegisterEvent("eagle3", 500, 1)
	end
end

function TempestDeath(Unit)
	Tempest = 1
	Unit:Despawn(1, 1800000)
end


RegisterUnitEvent(24175, 1, "Lookout_OnCombat")
RegisterUnitEvent(24225, 6, "WarOnSpawn")
RegisterUnitEvent(24159, 6, "EaglesOnSpawn")
RegisterUnitEvent(24549, 4, "TempestDeath")

--AkilZonEncounter AI--

timer = math.random(5000,10000)
timer2 = math.random(10000, 20000)
timer3 = math.random(4000, 15000)
timer4 = math.random(9000, 15000)
timer5 = math.random(8000, 10000)
a = 1
b = 0

function Akilzon_OnCombat(Unit, event)
	aggro = math.random(1, 2)
	if aggro == 1 then
	Unit:SendChatMessage(12, 0, "I be da predator! you da prey...")
	Unit:PlaySoundToSet(12013)
	end
	if aggro == 2 then
	Unit:SendChatMessage(12, 0, "Your death will be quick, strangers. You shoulda have never come to this place...")
	Unit:PlaySoundToSet(12123)
	end
	--Unit:RegisterEvent("Akilzon_ElectricalStorm", 10000, 1)
	Unit:RegisterEvent("Akilzon_GustOfWind", 30000, 0)
	Unit:RegisterEvent("Akilzon_StaticDisruption",timer, 0)
	Unit:RegisterEvent("Akilzon_CallLightning",timer2, 0)
	Unit:RegisterEvent("Akilzon_Enrage", 600000, 0)
end

function Akilzon_CallLightning(Unit)
        local plr = Unit:GetMainTank()
	if (plr ~= nil and Unit:IsCasting() == false) then
	Unit:FullCastSpellOnTarget(43661, plr)
	end
end

function Akilzon_GustOfWind(Unit)
	if Unit:IsCasting() == false then
        local plr = Unit:GetRandomPlayer(0)
        end
	if(plr ~= nil) then
	local x = plr:GetX()
	local y = plr:GetY()
	local z = plr:GetZ()
	Unit:Teleport(568, x, y, z+50)
	else
	end
end

function Akilzon_StaticDisruption(Unit)
        local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil and Unit:IsCasting() == false then
	Unit:CastSpellOnTarget(44008, plr)
	end
end

function Akilzon_Enrage(Unit)
	Unit:PlaySoundToSet(12016)
	Unit:CastSpell(34624)
end

function Akilzon_SummonEagles(Unit, event)
	Unit:SendChatMessage(12, 0, "Feed, me bruddahs!")
	Unit:PlaySoundToSet(12014)
	if b == 5 then
	end
	if b == 4 then
	x=Unit:GetX()
	y=Unit:GetY()
	z=Unit:GetZ()
	o=Unit:GetO()
	Unit:SpawnCreature(24858, x, y, z, o, 1890, 0)
	end
	if b == 3 then
	x=Unit:GetX()
	y=Unit:GetY()
	z=Unit:GetZ()
	o=Unit:GetO()
	Unit:SpawnCreature(24858, x, y, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x, y, z, o, 1890, 0)
	end
	if b == 2 then
	x=Unit:GetX()
	y=Unit:GetY()
	z=Unit:GetZ()
	o=Unit:GetO()
	Unit:SpawnCreature(24858, x, y, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x + 3, y, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x + 5, y + 2, z, o, 1890, 0)
	end
	if b == 1 then
	x=Unit:GetX()
	y=Unit:GetY()
	z=Unit:GetZ()
	o=Unit:GetO()
	Unit:SpawnCreature(24858, x, y, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x + 3, y, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x + 5, y + 2, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x - 6, y - 5, z, o, 1890, 0)
	end
	if b == 0 then
	x=Unit:GetX()
	y=Unit:GetY()
	z=Unit:GetZ()
	o=Unit:GetO()
	Unit:SpawnCreature(24858, x, y, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x + 3, y, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x + 5, y + 2, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x - 6, y - 5, z, o, 1890, 0)
	Unit:SpawnCreature(24858, x - 10, y -10, z, o, 1890, 0)
	end
end

function Akilzon_OnKilledTarget(Unit, event)
	death = math.random(1, 2);
	if death == 1 then
	Unit:SendChatMessage(12, 0, "Ya got nothin'!")
	Unit:PlaySoundToSet(12017)
	end
	if death == 2 then
	Unit:SendChatMessage(12, 0, "Stop your cryin'!")
	Unit:PlaySoundToSet(12018)
	local plr = Unit:GetRandomPlayer(0)
	if plr == nil then
	Unit:RemoveEvents()
	end
 end
end

function Akilzon_OnLeaveCombat(Unit, event)
	Unit:RemoveEvents()
end

function Akilzon_OnDied(Unit, event)
	Unit:SendChatMessage(12, 0, "You can't...kill...me spirit!")
	Unit:PlaySoundToSet(12019)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23574, 1, "Akilzon_OnCombat")
RegisterUnitEvent(23574, 2, "Akilzon_OnKilledTarget")
RegisterUnitEvent(23574, 3, "Akilzon_OnLeaveCombat")
RegisterUnitEvent(23574, 4, "Akilzon_OnDied")

--Soaring EaglesAI--

function SoaringSpawn(Unit, event)
	Unit:SetCombatMeleeCapable(1)
	b = a + 1
	Unit:RegisterEvent("SoaringSwoop", 100, 1)
	Unit:RegisterEvent("SoaringEagleWaypoints", 100, 1)
end

function SoaringEagleWaypoints(Unit, event)
	Unit:CreateCustomWaypointMap()
	Unit:CreateWaypoint(376.092651, 1409.007324, 92.494514,Unit:GetO(), 0, 768, 0)
	Unit:CreateWaypoint(356.203949, 1401.768677, 88.507416,Unit:GetO(), 0, 768, 0)
	Unit:CreateWaypoint(350.787079, 1425.123169, 89.999870,Unit:GetO(), 0, 768, 0)
	Unit:CreateWaypoint(376.493073, 1431.893433, 87.904907,Unit:GetO(), 0, 768, 0)
	Unit:CreateWaypoint(398.280548, 1417.045410, 87.688492,Unit:GetO(), 0, 768, 0)
	Unit:CreateWaypoint(396.586823, 1394.464722, 86.571831,Unit:GetO(), 0, 768, 0)
	Unit:CreateWaypoint(369.834503, 1380.180420, 85.854477,Unit:GetO(), 0, 768, 0)
	Unit:CastSpell(39870)
end
function SwoopMovement(Unit, event)
	local x = Unit:GetX()
	local y = Unit:GetY()
	local z = Unit:GetZ()
	local o = Unit:GetO()
	local tx = eagleplr:GetX()
	local ty = eagleplr:GetY()
	local tz = eagleplr:GetZ()
	Unit:MoveTo(tx, ty, tz, o)
	local dis = Unit:GetDistance(eagleplr)
	if (dis <= 1) then
	Unit:SetCombatCapable(1)
	Unit:WipeThreatList()
	Unit:MoveToWaypoint(0)
	local result = Unit:IsMoving()
		if( result == false) then
		Unit:SetCombatCapable(0)
		end
	else
	end
end
	
function SoaringSwoop(Unit, event)
	timer6 = math.random(8000, 10000)
	eagleplr = Unit:GetRandomPlayer(0)
	if (eagleplr ~= nil) then
	Unit:RegisterEvent("SwoopMovement", 100, 1)
	Unit:FullCastSpellOnTarget(44732, plr)
	end
	Unit:RegisterEvent("SoaringSwoop", timer6, 1)
	end

function SoaringDeath(Unit, event)
	b = a - 1
	Unit:DestroyCustomWaypointMap()
end

RegisterUnitEvent(24858, 6, "SoaringSpawn")
RegisterUnitEvent(24858, 4, "SoaringDeath")

--WindWalkerAI--

function WindWalker_OnCombat(Unit)
	Unit:RegisterEvent("WindWalkerFrostShock", 10000, 1)
	Unit:RegisterEvent("WindWalkerChainHeal", timer3, 1)
	Unit:RegisterEvent("WindWalkerLightningBolt", timer4, 1)
end

function WindWalkerFrostShock(Unit)
        local plr = Unit:GetClosestPlayer()
	if plr ~= nil and Unit:IsCasting() == false then
	Unit:FullCastSpellOnTarget(43524, plr)
	end
end

function WindWalkerChainHeal(Unit)
        if Unit:IsCasting() == true then
        else
        Unit:FullCastSpell(43527)
        end
end

function WindWalkerLightningBolt(Unit)
        local plr = Unit:GetMainTank()
	if (plr ~= nil and Unit:IsCasting() == false) then
		Unit:FullCastSpellOnTarget(43526, plr)
		end
end

function WindWalker_OnKilledTarget(Unit)
	Unit:RemoveEvents()
end

function WindWalker_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

function WindWalker_OnDied(Unit)
	Unit:RemoveEvents()
end
	
RegisterUnitEvent(24179, 1, "WindWalker_OnCombat")
RegisterUnitEvent(24179, 2, "WindWalker_OnKilledTarget")
RegisterUnitEvent(24179, 3, "WindWalker_OnLeaveCombat")
RegisterUnitEvent(24179, 4, "WindWalker_OnDied")

