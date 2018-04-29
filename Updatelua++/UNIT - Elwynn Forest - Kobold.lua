local TICKTIME = 1000 -- slower is better for the CPU but less accurate, ~10 seconds? for big bosses should be fine

-- set up managed variable mv_koboldCounter, "slotcount, slots, data" must not be renamed!
local mv_koboldCounter = {}
mv_koboldCounter.slotcount = 1
mv_koboldCounter.slots = {null}
mv_koboldCounter.data = {0}

function KoboldVermin_OnEnterCombat(pUnit, Event)
pUnit:SendChatMessage(11, 0, "Yiie!!")

-- set up the managed var
initialiseData(mv_koboldCounter,pUnit,1)

pUnit:RegisterEvent("KoboldVermin_OnTick",TICKTIME,0)
KoboldVermin_Stage1_1(pUnit, null)
end
RegisterUnitEvent(6, 1, "KoboldVermin_OnEnterCombat")

function KoboldVermin_OnDeath(pUnit, Event)
pUnit:SendChatMessage(11, 0, "Aiih!")

-- free up the managed var
freeData(mv_koboldCounter,pUnit)
end
RegisterUnitEvent(6, 4, "KoboldVermin_OnDeath")

-- stages
-- stage 1
function KoboldVermin_Stage1_1(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage1_1: Phear the kobold of doom!")
pUnit:RegisterEvent("KoboldVermin_Stage1_2",1000,1)
end

function KoboldVermin_Stage1_2(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage1_2: fire!")
pUnit:RegisterEvent("KoboldVermin_Stage1_3",500,1)
end

function KoboldVermin_Stage1_3(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage1_3: lightning!")
pUnit:RegisterEvent("KoboldVermin_Stage1_4",500,1)
end

function KoboldVermin_Stage1_4(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage1_4: shadow!")
pUnit:RegisterEvent("KoboldVermin_Stage1_2",500,1)
end


-- stage 2
function KoboldVermin_Stage2_1(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage2_1: simple repeating spell")
end

function KoboldVermin_Stage3_1(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage3_1: go big!")
pUnit:SetScale(4.5);
end


function KoboldVermin_Stage4_1(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage4_1: go tiny again!")
pUnit:SetScale(0.7);
end

function KoboldVermin_Stage5_1(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage5_1: enrage!")

pUnit:FullCastSpell(41305)
end


-- stage 6 triggers after 10 seconds of the critter being below 10% health
-- if you havnt killed it by then... mwahahah!
function KoboldVermin_Stage6_1(pUnit, Event)
pUnit:SendChatMessage(11, 0, "stage6_1: annihilate!")

pUnit:CastSpellOnTarget(19811,pUnit:GetClosestPlayer())
end

-- health ticker
function KoboldVermin_OnTick(pUnit, Event)
local healthpct = pUnit:GetHealthPct()
local newStage = 1
if healthpct >= 90 then
  newStage = 1
elseif healthpct >= 75 then
  newStage = 2
elseif healthpct >= 50 then
  newStage = 3
elseif healthpct >= 25 then
  newStage = 4
elseif healthpct >= 10 then
  newStage = 5
else
  newStage = 6  
end

local currentStage = getData(mv_koboldCounter,pUnit)
if currentStage ~= newStage then
  kobold_OnStageTransition(pUnit, newStage)
end
end


function kobold_OnStageTransition (u, newStage)
setData(mv_koboldCounter,u,newStage)
u:SendChatMessage(11, 0, "stage transition:" .. newStage)

-- kill all events
u:RemoveEvents(u)

-- make sure we put the ticker back in!!!
u:RegisterEvent("KoboldVermin_OnTick",TICKTIME,0)

-- register new events
if newStage == 2 then
  -- delayed stage needs registerevent
  u:RegisterEvent("KoboldVermin_Stage2_1",5000,0)
elseif newStage == 3 then
  -- instant stages dont need to be registered
  KoboldVermin_Stage3_1(u, null)
elseif newStage == 4 then
  KoboldVermin_Stage4_1(u, null)
elseif newStage == 5 then
  KoboldVermin_Stage5_1(u, null)
else
  u:RegisterEvent("KoboldVermin_Stage6_1",10000,1)
end
end