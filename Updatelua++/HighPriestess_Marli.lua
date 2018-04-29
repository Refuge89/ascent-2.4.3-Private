--[[********************************
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
-- SPIDER DISPLAY 15226
-- NORMAL DISPLAY 15220

RegisterUnitEvent(14510,1,"HPMarli_OnCombat")
RegisterUnitEvent(14510,2,"HPMarli_OnWipe")
RegisterUnitEvent(14510,4,"HPMarli_OnDied")

function HPMarli_OnCombat(Unit,event)
	Unit:RegisterEvent("HPMarli_SummonSpiders", 200, 4)
	Unit:RegisterEvent("HPMarli_Normal",1000, 1)
end
function HPMarli_Normal(Unit,event)
	Unit:SetModel(15220)
	Unit:RemoveEvents()
	Unit:RegisterEvent("HPMarli_SummonSpiders",27000, 0)
	Unit:RegisterEvent("HPMarli_PoisonVolley", 8000, 0)
	Unit:RegisterEvent("HPMarli_DrainLife", 24000, 0)
	Unit:RegisterEvent("HPMarli_SpiderForm", 60000, 1)
end
function HPMarli_PoisonVolley(Unit,event)
	Unit:FullCastSpell(24099)
end

function HPMarli_DrainLife(Unit,event)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:StopMovement(7000)
		Unit:FullCastSpellOnTarget(24300, plr)
        end
end

function HPMarli_SummonSpiders(Unit,event)
	local rand = math.random(1,3)
	if rand == 1 then
		Unit:SpawnCreature(11370,Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO(),Unit:GetFaction(),0)
	elseif rand == 2 then
		Unit:SpawnCreature(14532,Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO(),Unit:GetFaction(),0)
	elseif rand == 3 then
		Unit:SpawnCreature(14880,Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO(),Unit:GetFaction(),0)
	end
end

function HPMarli_OnWipe(Unit,event)
	if Unit:IsAlive() == true then
		Unit:RemoveEvents()
		Unit:SetModel(15220)
	else
		Unit:RemoveEvents()
	end
end
function HPMarli_OnDied(Unit,event)
	Unit:RemoveEvents()
	local display = Unit:GetUInt32Value(UNIT_FIELD_DISPLAYID)
	if display ~= 15220 then
		Unit:SetUInt32Value(UNIT_FIELD_DISPLAYID,15220)
	end
end
function HPMarli_SpiderForm(Unit,event)
	Unit:RemoveEvents()
	Unit:SetModel(15226)-- Change display to Spiderform.
	Unit:RegisterEvent("HPMarli_AOESilence", 100, 1)
	Unit:RegisterEvent("HPMarli_Web",3000, 1)
	Unit:RegisterEvent("HPMarli_SummonSpiders",27000, 0)
	Unit:RegisterEvent("HPMarli_ChargeCheck", 3500, 0)
	Unit:RegisterEvent("HPMarli_Normal", 60000, 1 )
end
function HPMarli_ChargeCheck(Unit,event)
	local tank = Unit:GetMainTank()
	if Unit:GetDistance(tank) >= 12 then
		Unit:FullCastSpellOnTarget(22911, tank)-- Charge if main tank is too far away.
		Unit:SetCombatTargetingCapable(1)
		Unit:ModifyRunSpeed(200)
		Unit:MoveTo(tank:GetX(), tank:GetY(), tank:GetZ())
		if (Unit:IsMoving() == false) then
			Unit:ModifyRunSpeed(8)
		end
	end
end


function HPMarli_Web(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k, v in pairs(tbl) do
		if Unit:GetDistance(v) <= 10 then
			Unit:FullCastSpellOnTarget(24110,v)-- Enveloping Web
                        v:ModThreat(0)
		end
	end
	Unit:RegisterEvent("HPMarli_Web",27000, 1)
end
function HPMarli_AOESilence(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k, v in pairs(tbl) do
		Unit:FullCastSpellOnTarget(15487, v) -- Iteration for Silence to cast on inrange players.
	end
end

--[[
	SPIDERs AI
	]]
RegisterUnitEvent(11370, 1, "HPMarli_SpiderGrow")
RegisterUnitEvent(14532, 1, "HPMarli_SpiderGrow")
RegisterUnitEvent(14880, 1, "HPMarli_SpiderGrow")

function HPMarli_SpiderGrow(Unit,event)
	local tbl = Unit:GetInRangeFriends()
	for k, v in pairs(tbl) do
		if v:GetEntry() == 14510 then
			if Unit:GetDistance(v) <= 1 then
				Unit:RegisterEvent("HPMarli_SpiderEnlarge", 2000, 0)
			end
		end
	end
end
function HPMarli_SpiderEnlarge(Unit,event)
	Unit:SetUInt32Value(UNIT_FIELD_MINDAMAGE,(Unit:GetUInt32Value(UNIT_FIELD_MINDAMAGE))+50)
	Unit:SetUInt32Value(UNIT_FIELD_MAXDAMAGE,(Unit:GetUInt32Value(UNIT_FIELD_MAXDAMAGE))+50)
	Unit:SetFloatValue(OBJECT_FIELD_SCALE_X,(Unit:GetFloatValue(OBJECT_FIELD_SCALE_X))+0.1)
end

