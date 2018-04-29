--[[ Sapphiron.lua
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
-- LUA++ staff, April 06, 2008. ]]


function Sapphiron_OnCombat(Unit, event)
	Sapphiron = Unit
	Sapphiron:RegisterEvent("Sapphiron_LifeDrain", 24000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Blizzard", 15000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Cleave", 10000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Enrage", 900000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Fly", 35000, 0)
	Sapphiron:RegisterEvent("Sapphiron_FrostAura", 2000, 0)
	Sapphiron:RegisterEvent("Sapphiron_CloseToDeath", 500, 0)
end

function Sapphiron_CloseToDeath(Unit, event)
	if Sapphiron:GetHealthPct() <= 10 then
	Sapphiron:RemoveEvents()
	Sapphiron:RegisterEvent("Sapphiron_LifeDrain", 24000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Blizzard", 15000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Cleave", 10000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Enrage", 900000, 0)
	else
 end
end
function Icebolt(Unit, event)
	local plr = Sapphiron:GetRandomPlayer(0)
	if (plr ~= nil) then
	Sapphiron:CastSpell(28522, plr)
	Sapphiron:RegisterEvent("ImmunityCheck", 500, 0)
	else
	end
end

function Sapphiron_FrostAura(Unit)
	Sapphiron:CastSpell(28531)
end

function Sapphiron_LifeDrain(Unit, event)
	local plr = Sapphiron:GetMainTank()
	if plr ~= nil then
	Sapphiron:FullCastSpellOnTarget(28542, Sapphiron:GetMainTank())
	else
	end
end

function Sapphiron_Blizzard(Unit, event)
	local plr = Sapphiron:GetRandomPlayer(0)
	if(plr ~= nil) then
	local x = plr:GetX()
	local y = plr:GetY()
	local z = plr:GetZ()
	Sapphiron:CastSpellAoF(x, y, z, 29951)
	else
	end
end

function Sapphiron_Cleave(Unit, event)
	local plr = Sapphiron:GetMainTank()
	if (plr ~= nil) then
	Sapphiron:CastSpellOnTarget(31345, plr)
	else
	end
end

function Sapphiron_Enrage(Unit)
	Sapphiron:CastSpell(18556)
end

function Sapphiron_Fly(Unit, event)
	Sapphiron:RemoveEvents()
	Sapphiron:SetFlying()
	Sapphiron:SetCombatMeleeCapable(1)
	Sapphiron:SetFieldFlags(2)
	Sapphiron:RegisterEvent("Sapphiron_Fly2", 2000, 1)
end
function Sapphiron_Fly2(Unit, event)
	Sapphiron:MoveTo(3520.601563, -5232.277832, 137.626328+10, 4.553010)
	Sapphiron:RegisterEvent("DestinationCheck", 500, 1)
end

function DestinationCheck(Unit, event)
	local result = Sapphiron:IsMoving()
	if(result == false) then
	Sapphiron:RegisterEvent("Icebolt", 2000, 5)
	Sapphiron:RegisterEvent("CastFrostBreath", 10000, 1)
	else
	Sapphiron:RegisterEvent("DestinationCheck", 500, 1)
	end
end

function ImmunityCheck(Unit, event)
	local rand = Sapphiron:GetRandomPlayer(0)
	if((rand:HasAura(28522) == true)) then
	Sapphiron:SpawnGameObject(181247,rand:GetX(),rand:GetY(),rand:GetZ(),rand:GetO(), 25000)
	end
end
function Frozen(Unit, event)
	local plr = Sapphiron:GetRandomPlayer(0)
	if (plr:HasAura(28522)) then
	Sapphiron:RemoveAura(28522)
	else
	Sapphiron:RegisterEvent("Frozen", 500, 1)
	end
end
function Sapphiron_CastFrostBreath(Unit, event)
	Sapphiron:FullCastSpell(28524)
	Sapphiron:RemoveEvents()
	Sapphiron:RegisterEvent("Sapphiron_Land", 8000, 1)
end

function Sapphiron_Land(Unit, event)
	Sapphiron:Land()
	Sapphiron:MoveTo(Sapphiron:GetX(),Sapphiron:GetY(),Sapphiron:GetZ()-10,Sapphiron:GetO())
	Sapphiron:RegisterEvent("Sapphiron_Normal", 8000, 1)
end

function Sapphiron_Normal(Unit, event)
	Sapphiron:RemoveEvents()
	Sapphiron:SetCombatMeleeCapable(0)
	Sapphiron:GetMainTank()
	Sapphiron:RegisterEvent("Sapphiron_Fly", 70000, 0)
	Sapphiron:RegisterEvent("Sapphiron_FrostAura", 2000, 0)
	Sapphiron:RegisterEvent("Sapphiron_LifeDrain", 24000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Blizzard", 15000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Cleave", 10000, 0)
	Sapphiron:RegisterEvent("Sapphiron_Enrage", 900000, 0)
end

function Sapphiron_OnWipe(Unit)
	Sapphiron:RemoveEvents()
end

function Sapphiron_OnLeaveCombat(Unit)
	Sapphiron:RemoveEvents()
end

function Sapphiron_OnDied(Unit)
	Sapphiron:RemoveEvents()
	Sapphiron:CastSpell(29357)
end


RegisterUnitEvent(15989, 1, "Sapphiron_OnCombat")
RegisterUnitEvent(15989, 2, "Sapphiron_OnLeaveCombat")
RegisterUnitEvent(15989, 3, "Sapphiron_OnWipe")
RegisterUnitEvent(15989, 4, "Sapphiron_OnDied")
