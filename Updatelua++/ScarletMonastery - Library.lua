--[[ Scarlet Monsatery - Library
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
-- LUA++ staff, April 15, 2008. ]]

-- Houndmaster Loksey
math.randomseed(os.time())

function HoundmasterLoksey_BattleShout(pUnit)
        pUnit:FullCastSpell(6192)
end

function HoundmasterLoksey_Enrage(pUnit)
    if pUnit:GetHealthPct() <= 25 then
        pUnit:RemoveEvents()
	    pUnit:FullCastSpell(28747)
	end
end

function HoundmasterLoksey_OnCombat(pUnit)
        pUnit:SendChatMessage(13,0,"Release the hounds!")
		pUnit:PlaySoundToSet(5841)
		pUnit:RegisterEvent("HoundmasterLoksey_BattleShout",math.random(15000,30000),0)
		pUnit:RegisterEvent("HoundmasterLoksey_Enrage",1000,0)
end

function HoundmasterLoksey_LeaveCombat(pUnit)
        pUnit:RemoveEvents()
        --collectgarbage(); --Running garbage collection to clean up unused data.
end

--[[function HoundmasterLoksey_OnDied(pUnit)
        pUnit:RemoveEvents() --I don't know if we need garbage collection on death, need some verification here.
end]]

RegisterUnitEvent(3974,1,"HoundmasterLoksey_OnCombat")
RegisterUnitEvent(3974,2,"HoundmasterLoksey_LeaveCombat")
--RegisterUnitEvent(3974,4,"HoundmasterLoksey_OnDied")

-- Arcanist Doan

function ArcanistDoan_Silence(pUnit)
    if (math.random(1,10) < 3) then
	    pUnit:FullCastSpell(8988)
	end
end

function ArcanistDoan_Polymoprh(pUnit)
    if (pUnit:GetRandomPlayer(7) ~= nil) then
          if ( math.random(1,10) < 4) then
			pUnit:FullCastSpellOnTarget(13323,pUnit:GetRandomPlayer(7))
		  end
	end
end
	 
function ArcanistDoan_ArcaneExplosion(pUnit)
        pUnit:FullCastSpell(8439)
end

function ArcanistDoan_Detonation(pUnit)
        pUnit:StopMovement(1000)
        pUnit:FullCastSpell(9435)
end

function ArcanistDoan_OnCombat(pUnit)
        pUnit:SendChatMessage(13, 0, "You will not defile these mysteries!")
        pUnit:PlaySoundToSet(5842)
        pUnit:RegisterEvent("ArcanistDoan_ArcaneExplosion",math.random(8000,14000),0)
		pUnit:RegisterEvent("ArcanistDoan_Polymoprh",15000,0)
		pUnit:RegisterEvent("ArcanistDoan_Silence",20000,0)
		pUnit:RegisterEvent("ArcanistDoan_Phase2",1000,0)
end

function ArcanistDoan_Phase2(pUnit)
    if pUnit:GetHealthPct() <= 50 then
	    pUnit:RemoveEvents()
	    pUnit:SendChatMessage(13,0,"Burn in righteous fire!")
		pUnit:PlaySoundToSet(5843)
		pUnit:FullCastSpell(ArcaneBubble)
		pUnit:RegisterEvent("ArcanistDoan_Detonation",2000,1)
	    pUnit:RegisterEvent("ArcanistDoan_ArcaneExplosion",math.random(8000,14000),0)
		pUnit:RegisterEvent("ArcanistDoan_Polymoprh",15000,0)
		pUnit:RegisterEvent("ArcanistDoan_Silence",20000,0)
    end
end

function ArcanistDoan_LeaveCombat(pUnit)
        pUnit:RemoveEvents()
end

RegisterUnitEvent(6487,1,"ArcanistDoan_OnCombat")
RegisterUnitEvent(6487,2,"ArcanistDoan_LeaveCombat")