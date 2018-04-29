--  [[ Coilfang Ambusher ]] --

function CoilfangAmbush_Multishot(unit)
local plr = unit:GetRandomPlayer(0)
if (plr ~= nil) then
unit:FullCastSpellOnTarget(27021,plr)
end
end

function CoilfangAmbush_OnEnterCombat(unit)
unit:RegisterEvent("CoilfangAmbush_Multishot",4500,99)
end
RegisterUnitEvent(21865, 1, "CoilfangAmbush_OnEnterCombat")

-- [[ Coilfang Fathom Witch ]] --

function CoilWitch_ShadowBolt(Unit)
local plr = unit:GetClosestPlayer()
if (plr ~= nil) then
   unit:FullCastSpellOnTarget(27209,plr)
end
end

function CoilWitch_Knockback(unit)
local plr = unit:GetRandomPlayer(1)
if (plr ~= nil) then
unit:FullCastSpellOnTarget(34109,plr)
end
end

function CoilWitch_OnEnterCombat(unit)
unit:RegisterEvent("CoilWitch_ShadowBolt",15000,99)
unit:RegisterEvent("CoilWitch_Knockback",60000,99)
end

RegisterUnitEvent(21299, 1, "CoilWitch_OnEnterCombat")

-- [[ CoilFang Guardian ]] --

function CoilGuard_Cleave(unit)
unit:FullCastSpellOnTarget(38260,unit:GetClosestPlayer())
end

function CoilGuard_OnEnterCombat(unit)
unit:RegisterEvent("CoilGuard_Cleave",40000,99)
end
RegisterUnitEvent(21873, 1, "CoilGuard_OnEnterCombat")

-- [[ Coilfang Priestess ]] --

function CoilPriest_Holynova(unit)
local plr = unit:GetRandomPlayer(0)
if (plr ~= nil) then
   unit:FullCastSpellOnTarget(38589,plr)
end
end

function CoilPriest_Smite(unit)
unit:FullCastSpellOnTarget(25364,unit:GetClosestPlayer())
end

function CoilPriest_OnEnterCombat(unit)
unit:RegisterEvent("CoilPriest_Holynova",35000,10)
unit:RegisterEvent("CoilPriest_Smite",5000,0)
end

RegisterUnitEvent(21220, 1, "CoilPriest_OnEnterCombat")


-- [[ Coilfang Serpent Guard ]] --
function CoilSert_SpellReflect(unit)
unit:FullCastSpell(36096)
end

function CoilSert_Cleave(unit)
unit:FullCastSpellOnTarget(38260,unit:GetClosestPlayer())
end

function CoilSert_OnEnterCombat(unit)
unit:RegisterEvent("CoilSert_SpellReflect",15000,10)
unit:RegisterEvent("CoilSert_Cleave",30000,0)
end

RegisterUnitEvent(21298, 1, "CoilSert_OnEnterCombat")

-- [[ Coilfang Shatterer ]] --

function CoilShat_ShatterArmor(unit)
unit:FullCastSpellOnTarget(38591,unit:GetClosestPlayer())
end

function CoilShat_OnEnterCombat(unit)
unit:RegisterEvent("CoilShat_ShatterArmor",30000,0)
end

RegisterUnitEvent(21301, 1, "CoilShat_OnEnterCombat")

-- [[ Coilfang Strider ]] --

function CoilStride_PsychicScream(unit)
unit:FullCastSpell(36096)
end

function CoilStride_OnEnterCombat(unit)
unit:RegisterEvent("CoilStride_PsychicScream",40000,2)
end

RegisterUnitEvent(22056, 1, "CoilStride_OnEnterCombat")

-- [[ Fathom Guard Caribdis ]] --

function FathGuardCarb_WaterBolt(unit)
unit:FullCastSpellOnTarget(38335,unit:GetClosestPlayer())
end

function FathGuardCarb_Heal(unit)
Unit:FullCastSpell(6064)
end

function FathGuardCarb_OnEnterCombat(unit)
unit:RegisterEvent("FathGuardCarb_Heal",10000,0)
unit:RegisterEvent("FathGuardCarb_WaterBolt",40000,0)
end

RegisterUnitEvent(21964, 1, "FathGuardCarb_OnEnterCombat")

-- [[ Fathom Guard Sharkkis ]] --

function FathGuardShark_Multishot(unit)
unit:FullCastSpellOnTarget(27021,unit:GetClosestPlayer())
end

function FathGuardShark_Vipersting(unit)
unit:FullCastSpellOnTarget(37551,unit:GetClosestPlayer())
end

function FathGuardShark_OnEnterCombat(unit)
FathGuardSharkSpawn = math.random(1, 2)
if (FathGuardSharkSpawn==1) then
x=unit:GetX();
y=unit:GetY();
z=unit:GetZ();
unit:SpawnCreature(21260, x, y, z, 0, 14, 360000);
end
if (FathGuardSharkSpawn==2) then
x=unit:GetX();
y=unit:GetY();
z=unit:GetZ();
unit:SpawnCreature(21246, x, y, z, 0, 14, 360000);
end
unit:RegisterEvent("FathGuardShark_Multishot",8000,0)
unit:RegisterEvent("FathGuardShark_Vipersting",20000,0)
end
function FathGuardShark_OnLeaveCombat(unit)
unit:Despawn(1000, 0);
-- unit:RemoveEvents()
end

RegisterUnitEvent(21966, 1, "FathGuardShark_OnEnterCombat")
RegisterUnitEvent(21966, 2, "FathGuardShark_OLeaveCombat")

-- [[ Fathom Guard Tidalves ]] --

function FathGuardTidal_Spitfire(unit)
unit:FullCastSpell(38236)
end

function FathGuardTidal_Cleansing(unit)
unit:FullCastSpell(8170)
end

function FathGuardTidal_Earthbind(unit)
unit:FullCastSpell(2484)
end

function FathGuardTidal_OnEnterCombat(unit)
unit:RegisterEvent("FathGuardTidal_Earthbind",20000,0)
unit:RegisterEvent("FathGuardTidal_Spitfire",50000,0)
unit:RegisterEvent("FathGuardTidal_Cleansing",30000,0)
end
RegisterUnitEvent(21965, 1, "FathGuardTidal_OnEnterCombat")

-- [[ GreyHeart Nether Mage ]] --

function GreyNetherMage_RainFire(unit)
local plr = unit:GetRandomPlayer(0)
if (plr ~= nil) then
unit:FullCastSpellOnTarget(27212,plr)
end
end

function GreyNetherMage_Fireball(unit)
unit:FullCastSpellOnTarget(38836,unit:GetClosestPlayer())
end

function GreyNetherMage_ConeOfCold(unit)
unit:FullCastSpellOnTarget(27087,unit:GetClosestPlayer())
end

function GreyNetherMage_Frostbolt(unit)
unit:FullCastSpellOnTarget(37262,unit:GetClosestPlayer())
end

function GreyNetherMage_Lightning(unit)
unit:FullCastSpellOnTarget(38146,unit:GetClosestPlayer())
end

function GreyNetherMage_OnEnterCombat(unit)
unit:RegisterEvent("GreyNetherMage_RainFire",10000,1)
unit:RegisterEvent("GreyNetherMage_Fireball",20000,1)
unit:RegisterEvent("GreyNetherMage_ConeOfCold",30000,3)
unit:RegisterEvent("GreyNetherMage_Frostbolt",40000,3)
unit:RegisterEvent("GreyNetherMage_Lightning",50000,3)
end
RegisterUnitEvent(21230, 1, "GreyNetherMage_OnEnterCombat")

-- [[ Greyheart Shield Bearer ]]--

function GreyShieldBearer_AvengerShield(unit)
unit:FullCastSpellOnTarget(32700,unit:GetClosestPlayer())
end

function GreyShieldBearer_Charge(unit)
unit:FullCastSpellOnTarget(11578,unit:GetClosestPlayer())
end

function GreyShieldBearer_OnEnterCombat(unit)
unit:RegisterEvent("GreyShieldBearer_AvengerShield",20000,0)
unit:RegisterEvent("GreyShieldBearer_Charge",1000,0)
end
RegisterUnitEvent(21231, 1, "GreyShieldBearer_OnEnterCombat")

-- [[ Greyheart TideCaller ]] --

function GreyTide_PoisonShield(unit)
unit:FullCastSpell(39027)
end

function GreyTide_ChainLightning(unit)
unit:FullCastSpellOnTarget(25442,unit:GetClosestPlayer())
end

function GreyTide_WaterTotem(unit)
unit:FullCastSpell(38624)
end

function GreyTide_OnEnterCombat(unit)
unit:RegisterEvent("GreyTide_PoisonShield",40000,0)
unit:RegisterEvent("GreyTide_ChainLightning",20000,0)
unit:RegisterEvent("GreyTide_WaterTotem",230000,0)
end

RegisterUnitEvent(21229, 1, "GreyTide_OnEnterCombat")

-- [[ Tidewalker Depth-Seer]] --

function TideWalkerSeer_Tranquility(unit)
unit:FullCastSpell(26983)
end

function TideWalkerSeer_OnEnterCombat(unit)
unit:RegisterEvent("TideWalkerSeer_Tranquility",40000,0)
end

RegisterUnitEvent(21224, 1, "TideWalkerSeer_OnEnterCombat")


--[[ Tidewalker Harpooner ]] --

function TideWalkerHarp_Net(unit)
unit:FullCastSpellOnTarget(38661,unit:GetClosestPlayer())
end

function TideWalkerHarp_OnEnterCombat(unit)
unit:RegisterEvent("TideWalkerHarp_Net",25000,0)
end

RegisterUnitEvent(21227, 1, "TideWalkerHarp_OnEnterCombat")

--[[ Tidewalker Hydromancer ]] --

function TideWalkerHydro_Frostbolt(unit)
unit:FullCastSpellOnTarget(38697,unit:GetClosestPlayer())
end

function TideWalkerHydro_FrostNova(unit)
unit:FullCastSpell(27088)
end

function TideWalkerHydro_FrostShock(unit)
unit:FullCastSpellOnTarget(25464,unit:GetClosestPlayer())
end

function TideWalkerHydro_OnEnterCombat(unit)
unit:RegisterEvent("TideWalkerHydro_Frostbolt",20000,0)
unit:RegisterEvent("TideWalkerHydro_FrostNova",35000,0)
unit:RegisterEvent("TideWalkerHydro_FrostShock",50000,0)
end
RegisterUnitEvent(21228, 1, "TideWalkerHydro_OnEnterCombat")

-- [[ TideWalker Warrior]] --
function TideWalkerWarrior_Cleave(unit)
unit:FullCastSpellOnTarget(38260,unit:GetClosestPlayer())
end

function TideWalkerWarrior_BloodThirst(unit)
unit:FullCastSpellOnTarget(30335,unit:GetClosestPlayer())
end

function TideWalkerWarrior_Frenzy(unit)
unit:FullCastSpell(37605)
end

function TideWalkerWarrior_OnEnterCombat(unit)
unit:RegisterEvent("TideWalkerWarrior_Cleave",30000,0)
unit:RegisterEvent("TideWalkerWarrior_BloodThirst",45000,0)
unit:RegisterEvent("TideWalkerWarrior_Frenzy",20000,0)
end
RegisterUnitEvent(21225, 1, "TideWalkerHydro_OnEnterCombat")

-- [[ Underbog Collosus ]] --

function UnderCollosus_Geyser(unit)
unit:FullCastSpellOnTarget(37959,unit:GetClosestPlayer())
end

function UnderCollosus_AtropicBlow(unit)
unit:FullCastSpellOnTarget(39015,unit:GetClosestPlayer())
end

function UnderCollosus_SporeQuake(unit)
unit:FullCastSpell(38976)
end

function UnderCollosus_ToxicPool(unit)
unit:FullCastSpell(38718)
end

function UnderCollosus_Frenzy(unit)
unit:FullCastSpell(37605)
end

function UnderCollosus_RampInfection(unit)
unit:FullCastSpellOnTarget(39042,unit:GetClosestPlayer())
end

function UnderCollosus_OnEnterCombat(unit)
unit:RegisterEvent("UnderCollosus_Geyser",50000,2)
unit:RegisterEvent("UnderCollosus_AtropicBlow",20000,0)
unit:RegisterEvent("UnderCollosus_SporeQuake",65000,2)
unit:RegisterEvent("UnderCollosus_ToxicPool",55000,0)
unit:RegisterEvent("UnderCollosus_Frenzy",45000,4)
unit:RegisterEvent("UnderCollosus_RampInfection",30000,0)
end

function UnderCollosus_OnDied(unit)
UnderCollosusSpawn = math.random(1, 4)
if (UnderCollosusSpawn==1) then
x=unit:GetX();
y=unit:GetY();
z=unit:GetZ();
unit:SpawnCreature(22352, x, y, z, 0, 14, 360000);
unit:SpawnCreature(22352, x, y, z, 0, 14, 360000);
unit:SpawnCreature(22352, x, y, z, 0, 14, 360000);
unit:SpawnCreature(22352, x, y, z, 0, 14, 360000);
unit:SpawnCreature(22352, x, y, z, 0, 14, 360000);
unit:SpawnCreature(22352, x, y, z, 0, 14, 360000);
unit:SpawnCreature(22352, x, y, z, 0, 14, 360000);
end
if (UnderCollosusSpawn==2) then
unit:FullCastSpell(38718)
end
if (UnderCollosusSpawn==3) then
x=unit:GetX();
y=unit:GetY();
z=unit:GetZ();
unit:SpawnCreature(22347, x, y, z, 0, 14, 360000);
unit:SpawnCreature(22347, x, y, z, 0, 14, 360000);
end
if (UnderCollosusSpawn==4) then
unit:FullCastSpell(38730)
end
end
RegisterUnitEvent(21251, 1, "UnderCollosus_OnEnterCombat")
RegisterUnitEvent(21251, 4, "UnderCollosus_OnDied")