function Kael_OnCombat(Unit, Event) 
Unit:SendChatMessage(12, 0, "Don't look so smug! I know what you're thinking, but Tempest Keep was merely a set back. Did you honestly believe I would trust the future to some blind, half-night elf mongrel? Hahahaha... Oh no, no, no, he was merely an instrument, a stepping stone to a much larger plan! It has all led to this...and this time, you will not interfere!
")
Unit:RegisterEvent("Kael_FireBolt", 8000, 1)
Unit:RegisterEvent("Kael_Flamestrike", 18000, 1)
Unit:RegisterEvent("Kael_Phoenix", 35000, 1)
Unit:RegisterEvent("Kael_Gravity",1000,0)
end

function Kael_FireBolt(pUnit, Event) 
pUnit:FullCastSpellOnTarget(46164, pUnit:GetRandomPlayer(4)) 
end

function Kael_Flamestrike(pUnit, Event) 
pUnit:CastSpell(46162, pUnit:GetRandomPlayer(0)) 
Unit:SendChatMessage(12, 0, "Felomin ashal!")
end

function Kael_Phoenix(pUnit, Event) 
pUnit:FullCastSpellOnTarget(44194, pUnit:GetRandomPlayer(6)) 
Unit:SendChatMessage(12, 0, "Vengeance burns!")
end

function Kael_Gravity(pUnit, Event) 
if pUnit:GetHealthPct() < 50 then 
pUnit:RemoveEvents(); 
pUnit:FullCastSpell(44224)
Unit:SendChatMessage(12, 0, "I'll turn your world...upside...down")
end 
end

function Kael_OnLeaveCombat(Unit, Event) 
Unit:RemoveEvents() 
end

function Kael_OnDied(Unit, Event) 
Unit:RemoveEvents() 
Unit:SendChatMessage(12, 0, "My demise accomplishes nothing! The Master will have you! You will drown in your own blood! The world shall burn! Aaaghh!") 
end

function Kael_OnKilledTarget(Unit, Event) 
end

RegisterUnitEvent(24664, 1, "Kael_OnCombat")
RegisterUnitEvent(24664, 2, "Kael_OnLeaveCombat")
RegisterUnitEvent(24664, 3, "Kael_OnKilledTarget")
RegisterUnitEvent(24664, 4, "Kael_OnDied")