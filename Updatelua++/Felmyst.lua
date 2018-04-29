--[[ Felmyst.lua
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


-- Felmyst by Project eXa and AntiWar
--Phaze1 (about 75seconds)

function Fel_Cleave(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I am stronger than ever before!")
pUnit:CastSpellOnTarget(31345, pUnit:GetMainTank())
end

function Fel_Corrosion(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I am stronger than ever before!")
pUnit:FullCastSpellOnTarget(45866, pUnit:GetMainTank())
end

function Fel_NoxiousFumes(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I am stronger than ever before!")
pUnit:FullCastSpell(45738)
end

function Fel_GasNova(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I am stronger than ever before!")
pUnit:FullCastSpell(45855)
end

function Fel_Encapsulate(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I am stronger than ever before!")
pUnit:CastSpellOnTarget(45665, pUnit:GetRandomTarget(0))
end

function Fel_OnCombat(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Glory to Kil'jaeden! Death to all who oppose!")
pUnit:RegisterEvent("Fel_Cleave",20000,0)
pUnit:RegisterEvent("Fel_Corrosion",36000,0)
pUnit:RegisterEvent("Fel_NoxiousFumes",27000,0)
pUnit:RegisterEvent("Fel_GasNova",30000,0)
pUnit:RegisterEvent("Fel_Encapsulate",45000,0)
--pUnit:RegisterEvent("Phaze2",75000,1)
end

function Fel_OnLeaveCombat(pUnit, Event)
pUnit:RemoveEvents()
end

function Fel_OnKilledTarget(pUnit, Event)
Choice=math.random(1,2)
if Choice==1 then
pUnit:SendChatMessage(12, 0, "I kill for the master!")
elseif Choice==2 then
pUnit:SendChatMessage(12, 0, "The end has come!")
end
end

function Fel_OnDied(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Kil'jaeden... will... prevail...")
pUnit:RemoveEvents()
end


--Phaze2 (about 75seconds) SHIT and i know its not strung together

function Phaze2(pUnit, Event)
--pUnit:Emote(?????)
end


function Fel_DemonicVapor(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I am stronger than ever before!")
pUnit:CastSpell(45402)
pUnit:SpawnCreature(30170, x-1, y, z, o, 14, o)
pUnit:SpawnCreature(30170, x+1, y, z, o, 14, o)
pUnit:SpawnCreature(30170, x, y-1, z, o, 14, o)
pUnit:SpawnCreature(30170, x, y+1, z, o, 14, o)
pUnit:SpawnCreature(30170, x-3, y, z, o, 14, o)
pUnit:SpawnCreature(30170, x+3, y, z, o, 14, o)
x = pUnit:GetX()
y = pUnit:GetY()
z = pUnit:GetZ()
o = pUnit:GetO()
end

function Fel_GreenVapor(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I am stronger than ever before!")
--pUnit:CastSpell(?????)
end

RegisterUnitEvent(25038, 1, "Fel_OnCombat")
RegisterUnitEvent(25038, 2, "Fel_OnLeaveCombat")
RegisterUnitEvent(25038, 3, "Fel_OnKilledTarget")
RegisterUnitEvent(25038, 4, "Fel_OnDied")



--First Boss forgot the name
--You want it more blizz like do it urself

--Phaze1
function Kel_SpectralExhaustion(pUnit, Event)
pUnit:CastSpell(44867)	
end

function Kel_SpectralRealm(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I will purge you!")
pUnit:CastSpellOnTarget(46021, pUnit:GetRandomPlayer(0))
pUnit:RegisterEvent("Kel_SpectralExhaustion",60000,1)
end

function Kel_SpectralBlast(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Your pain has only begun!")
pUnit:CastSpellOnTarget(44866, pUnit:GetMainTank())
pUnit:RegisterEvent("Kel_SpectralRealm",1000,1)
end

function Kel_WildMagic(pUnit, Event)
Choice=math.random(1,6)
if Choice==1 then
pUnit:CastSpell(44978)
elseif Choice==2 then
pUnit:CastSpell(45001)
elseif Choice==3 then
pUnit:CastSpell(45002)
elseif Choice==4 then
pUnit:CastSpell(45004)
elseif Choice==5 then
pUnit:CastSpell(45006)
elseif Choice==6 then
pUnit:castSpell(45010)	
end
end

function Kel_FrostBreath(pUnit)
pUnit:FullCastSpell(44799)	
end

function Kel_ArcaneBuffet(pUnit, Event)
pUnit:CastSpell(45018)
end

function Kel_OnCombat(pUnit, Event)
pUnit:SendChatMessage(12, 0, "No longer will I be a slave to Malygos! Challenge me and you will be destroyed!")
pUnit:RegisterEvent("Kel_ArcaneBuffet",5000,0)
pUnit:RegisterEvent("Kel_FrostBreath",35000,0)
pUnit:RegisterEvent("Kel_WildMagic",20000,0)
pUnit:RegisterEvent("Kel_SpectralBlast",30000,0)
pUnit:RegisterEvent("Kel_SpectralExhaustion",replaceme,0)
end

function Kel_OnLeaveCombat(pUnit, Event)
pUnit:RemoveEvents()	
end

function Kel_OnKilledTarget(pUnit, Event)
Choice=math.random(1,2)
if Choice==1 then
pUnit:SendChatMessage(12, 0, "In the name of Kil'jaeden!")
elseif Choice==2 then
pUnit:SencChatMessage(12, 0, "You were warned!")
end	
end

function Kel_OnDied(pUnit, Event)
pUnit:RemoveEvents()	
end

--Phaze2
function Sath_Curse(pUnit, Event)
if Choice==1 then
pUnit:SendChatMessage(12, 0, "Your misery is my delight!")
elseif Choice==2 then
pUnit:SendChatMessage(12, 0, " will watch you bleed!")
end
pUnit:SendChatMessage(12, 0, "real message goes here")
pUnit:CastSpellOnTarget(45034, pUnit:GetRandomPlayer(0))	
end

function Sath_ShadowBoltVolley(pUnit, Event)
Choice=math.random(1,2)
if Choice == 1 then
pUnit:SendChatMessage(12, 0, "Your misery is my delight!")
elseif Choice == 2 then
pUnit:SendChatMessage(12, 0, " will watch you bleed!")
end
pUnit:CastSpellOnTarget(38840, pUnit:GetRandomPlayer(0))
end

function Sath_CorruptingStrike(pUnit, Event)
if Choice == 1 and then
pUnit:SendChatMessage(12, 0, "Your misery is my delight!")
elseif Choice == 2 then
pUnit:SendChatMessage(12, 0, " will watch you bleed!")
end
pUnit:CastSpellOnTarget(45029, pUnit:GetRandomPlayer(0))	
end

function Sath_OnCombat(pUnit, Event)
pUnit:SendChatMessage(12, 0, "Gyahaha... There will be no reprieve. My work here is nearly finished.")
pUnit:RegisterEvent("Sath_Curse",35000,0)
pUnit:RegisterEvent("ShadowBoltVolley",10000,0)
pUnit:RegisterEvent("Sath_CorruptingStrike",25000,0)
end

function Sath_OnLeaveCombat(pUnit, Event)
pUnit:RemoveEvents()	
end

function Sath_OnKilledTarget(pUnit, Event)
Choice=math.random
if Choice==1 then
pUnit:SendChatMessage(12, 0, "Pitious mortal!")
elseif Choice==2 then
pUnit:SendChatMessage(12, 0, "Haven't you heard? I always win!")	
end
end

function Sath_OnDied(pUnit, Event)
pUnit:SendChatMessage(12, 0, "I'm... never on... the losing... side...")
pUnit:RemoveEvents()	
end

RegisterUnitEvent(24850, 1, "Kel_OnCombat")
RegisterUnitEvent(24850, 2, "Kel_OnLeaveCombat")
RegisterUnitEvent(24850, 3, "Kel_OnKilledTarget")
RegisterUnitEvent(24850, 4, "Kel_OnDied")
RegisterUnitEvent(24892, 1, "Sath_OnCombat")
RegisterUnitEvent(24892, 2, "Sath_OnLeaveCombat")
RegisterUnitEvent(24892, 3, "Sath_OnKilledTarget")
RegisterUnitEvent(24892, 4, "Sath_OnDied")


