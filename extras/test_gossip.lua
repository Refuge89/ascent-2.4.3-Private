function test_gossip_unit_on_talk(unit, event, player)

    -- GossipCreateMenu(npc_text_id, target_player, bool autosend(1/0))

    unit:GossipCreateMenu(669, player, 0)
    unit:GossipMenuAddItem(0, "Test button1", 0, 0)
    unit:GossipMenuAddItem(0, "Test button2", 1, 0)
    unit:GossipSendMenu(player)
end

function test_gossip_unit_on_select(unit, event, player, id, intid, code)

    if(intid == 0) then
         player:SendAreaTriggerMessage("Test Button 1")
         unit:GossipComplete(player)
    end

    if(intid == 1) then
         player:SendAreaTriggerMessage("Test Button 2")
         unit:GossipCreateMenu(699, player, 1)
         unit:GossipSendMenu(player)
    end 
end

RegisterUnitGossipEvent(11943, 1, "test_gossip_unit_on_talk")
RegisterUnitGossipEvent(11943, 2, "test_gossip_unit_on_select")

-- |============================================================================

function test_gossip_item_on_talk(item, event, player)

    -- GossipCreateMenu(npc_text_id, target_player, bool autosend(1/0))

    item:GossipCreateMenu(669, player, 0)
    item:GossipMenuAddItem(0, "Test button1", 0, 0)
    item:GossipMenuAddItem(0, "Test button2", 1, 0)
    item:GossipSendMenu(player)
end

function test_gossip_item_on_select(item, event, player, id, intid, code)

    if(intid == 0) then
         player:SendAreaTriggerMessage("Test Button 1")
         item:GossipComplete(player)
    end

    if(intid == 1) then
         player:SendAreaTriggerMessage("Test Button 2")
         item:GossipCreateMenu(698, player, 1)
         item:GossipSendMenu(player)
    end 
end

RegisterItemGossipEvent(159, 1, "test_gossip_item_on_talk")
RegisterItemGossipEvent(159, 2, "test_gossip_item_on_select")

-- |============================================================================

function test_gossip_go_on_use(go, event, player)

    -- GossipCreateMenu(npc_text_id, target_player, bool autosend(1/0))

    go:GossipCreateMenu(669, player, 0)
    go:GossipMenuAddItem(0, "Test button1", 0, 0)
    go:GossipMenuAddItem(0, "Test button2", 1, 0)
    go:GossipSendMenu(player)
end

function test_gossip_go_on_select(go, event, player, id, intid, code)
    if(intid == 0) then
         player:SendAreaTriggerMessage("Test Button 1")
         go:GossipComplete(player)
    end

    if(intid == 1) then
         player:SendAreaTriggerMessage("Test Button 2")
         go:GossipCreateMenu(699, player, 1)
         go:GossipSendMenu(player)
    end 
end

RegisterGameObjectEvent(180452, 2, "test_gossip_go_on_use")
RegisterGOGossipEvent(180452, 2, "test_gossip_go_on_select")