function Undeadex_Callofgrave(Unit)
	Unit:CastSpell(5137)
end

function Undeadex_OnCombat(Unit, event)
	Unit:RegisterEvent("Undeadex_Callofgrave",10000 , 0)
end

RegisterUnitEvent(624, 0, "Undeadex_OnCombat")

function Undeaddyn_dynamite(Unit)
	Unit:CastSpell(7395)
end

function Undeaddyn_OnCombat(Unit, event)
	Unit:RegisterEvent("Undeadex_dynamite",6500 , 0)
end

RegisterUnitEvent(625, 0, "Undeaddyn_OnCombat")


function Undeadskel_strike(Unit)
	Unit:CastSpell(11976)
end

function Undeaddyn_OnCombat(Unit, event)
	Unit:RegisterEvent("Undeadskel_dynamite",3000 , 0)
end

RegisterUnitEvent(623, 0, "Undeadskel_OnCombat")

function woodcarver_strike(Unit)
	Unit:CastSpell(40505)
end

function woodcarver_OnCombat(Unit, event)
	Unit:RegisterEvent("Undeadskel_dynamite",8000 , 0)
	Unit:CastSpell(6466)
end

RegisterUnitEvent(641, 0, "woodcarver_OnCombat")

function engineer_spawn(Unit)
	Unit:CastSpell(3605)
end

function engineer_OnCombat(Unit, event)
	Unit:RegisterEvent("engineer_spawn",20000 , 0)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(622, 0, "engineer_OnCombat")

function crafts_ore(Unit)
	Unit:CastSpell(5159)
end

function crafts_OnCombat(Unit, event)
	Unit:RegisterEvent("crafts_ore",20000 , 0)
	Unit:CastSpell(5159)
end

RegisterUnitEvent(1731, 0, "crafts_OnCombat")

function wizard_ice(Unit)
	Unit:CastSpell(113)
end

function wizard_fire(Unit)
	Unit:CastSpell(9053)
end

function wizard_OnCombat(Unit, event)
	Unit:RegisterEvent("wizard_ice",12000 , 0)
	Unit:RegisterEvent("wizard_fire",4000 , 0)
	Unit:CastSpell(4979)
end

RegisterUnitEvent(4418, 0, "wizard_OnCombat")

function watchman_OnCombat(Unit, event)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(1725, 0, "watchman_OnCombat")

function task_peirce(Unit)
	Unit:CastSpell(6685)
end

function task_OnCombat(Unit, event)
	Unit:RegisterEvent("task_peirce",8000 , 0)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(4417, 0, "task_OnCombat")

function strip_peirce(Unit)
	Unit:CastSpell(6016)
end

function strip_OnCombat(Unit, event)
	Unit:RegisterEvent("task_peirce",8000 , 0)
end

RegisterUnitEvent(4416, 0, "strip_OnCombat")
RegisterUnitEvent(598, 0, "strip_OnCombat")

function squal_blast(Unit)
	Unit:CastSpell(6016)
end

function squal_freeze(Unit)
	Unit:CastSpell(122)
end

function squal_OnCombat(Unit, event)
	Unit:RegisterEvent("squal_blast",8000 , 0)
	Unit:RegisterEvent("squal_freeze",12000 , 0)
	Unit:CastSpell(12544)
end

RegisterUnitEvent(1732, 0, "squal_OnCombat")

function pirate_OnCombat(Unit, event)
	Unit:CastSpell(5172)
end

RegisterUnitEvent(657, 0, "pirate_OnCombat")

function overseer_shout(Unit)
	Unit:CastSpell(5115)
end

function overseer_OnCombat(Unit, event)
	Unit:CastSpell(5115)
	Unit:RegisterEvent("overseer_shout",14000 , 0)
end

RegisterUnitEvent(634, 0, "overseer_OnCombat")

function blackguard_OnSpawn(Unit, event)
	Unit:CastSpell(6408)
end

RegisterUnitEvent(636, 0, "blackguard_OnSpawn")

function mage_fire(Unit)
	Unit:CastSpell(9053)
end

function mage_OnSpawn(Unit, event)
	Unit:CastSpell(5110)
	Unit:RegisterEvent("mage_fire",4000 , 0)
end


RegisterUnitEvent(1726, 0, "mage_OnSpawn")

function hench_slam(Unit)
	Unit:CastSpell(8242)
end

function hench_OnSpawn(Unit, event)
	Unit:RegisterEvent("hench_slam",8000 , 0)
end


RegisterUnitEvent(594, 0, "hench_OnSpawn")

function evoke_strike(Unit)
	Unit:CastSpell(11829)
end

function evoke_OnSpawn(Unit, event)
	Unit:RegisterEvent("evoke_strike",8500 , 0)
	local spruch = math.random(1,2)
	if (spruch == 1) then
		Unit:CastSpell(12544)
	elseif (spruch == 2) then
		Unit:CastSpell(4979)
	end
end



RegisterUnitEvent(1729, 0, "evoke_OnSpawn")

function conjure_fire(Unit)
	Unit:CastSpell(9053)
end

function conjure_OnSpawn(Unit, event)
	Unit:RegisterEvent("evoke_strike",3500 , 0)
end



RegisterUnitEvent(619, 0, "conjure_OnSpawn")

--###################
--#      Bosses     #
--###################

function Greenskin_cleave(Unit)
	Unit:CastSpell(40505)
end

function Greenskin_harpoon(Unit)
	local plr = Unit:GetRandomPlayer()
	if (plr ~= nil) then
		Unit:CastSpell(5208, plr)
	end
end

function Greenskin_OnSpawn(Unit, event)
	Unit:RegisterEvent("Greenskin_cleave",3500 , 0)
	Unit:RegisterEvent("Greenskin_harpoon",8500 , 0)
end



RegisterUnitEvent(647, 0, "Greenskin_OnSpawn")

function Cookie_Heal(Unit)
	if Unit:GetHealthPct() < 50 then
		Unit:CastSpell(5174)
	end
end

function Cookie_Splash(Unit)
	local plr = Unit:GetRandomPlayer()
	if (plr ~= nil) then
		Unit:CastSpell(6306, plr)
	end
end

function Cookie_OnSpawn(Unit, event)
	Unit:RegisterEvent("Cookie_Heal",15000 , 0)
	Unit:RegisterEvent("Cookie_Splash",8500 , 0)
end

RegisterUnitEvent(645, 0, "Cookie_OnSpawn")

function VC_Thrash(Unit)
	Unit:CastSpell(3391)
end

function VC_spawn(Unit)
	if Unit:GetHealthPct() < 50 then
		Unit:CastSpell(5200)
		Unit:RemoveEvents()
	end
end

function VC_OnSpawn(Unit, event)
	Unit:RegisterEvent("VC_Thrash",3000 , 0)
	Unit:RegisterEvent("VC_spawn",0 , 0)
end

RegisterUnitEvent(639, 0, "VC_OnSpawn")


function FT_spell(Unit)
	Unit:CastSpell(5219)
end

function FT_OnSpawn(Unit, event)
	Unit:RegisterEvent("FT_spell",10000 , 0)
end

RegisterUnitEvent(639, 0, "FT_OnSpawn")


function Gil_spell(Unit)
	Unit:CastSpell(5213)
end

function Gil_OnSpawn(Unit, event)
	Unit:RegisterEvent("Gil_spell",10000 , 0)
end

RegisterUnitEvent(1763, 0, "Gil_OnSpawn")

function Mar_spell(Unit)
	Unit:CastSpell(9053)
end

function Mar_OnSpawn(Unit, event)
	Unit:RegisterEvent("Mar_spell",3000 , 0)
end

RegisterUnitEvent(599, 0, "Mar_OnSpawn")

--Smite
--Im not sure how to do the go to the chest and change weps part so um yeah
--anyone wanna finish smite for me

function Rak_spell(Unit)
	Unit:CastSpell(6304)
end

function Rak_OnSpawn(Unit, event)
	Unit:RegisterEvent("Rak_spell",3000 , 0)
end

RegisterUnitEvent(644, 0, "Rak_OnSpawn")

function Sneed_spell(Unit)
	Unit:CastSpell(6713)
end

function Sneed_OnSpawn(Unit, event)
	Unit:RegisterEvent("Sneed_spell",10000 , 0)
end

RegisterUnitEvent(643, 0, "Sneed_OnSpawn")

function Shred_spell(Unit)
	Unit:CastSpell(3603)
end

function Shred_OnSpawn(Unit, event)
	Unit:RegisterEvent("Shred_spell",45000 , 0)
end

function Shred_OnDied(Unit, event)
	Unit:CastSpell(5141)
end

RegisterUnitEvent(642, 0, "Shred_OnSpawn")
