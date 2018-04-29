--[[ selin_fireheart.lua
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
-- LUA++ staff, April 04, 2008. ]]

--[[ some infos

--> The door to the room where Selin is will be close on fight, and open if Selin is dead.
--> Siphon Fel Crystal(NPC 24722): Siphons mana from a nearby Fel Crystal, drawing energy from it. Will continue until either the crystal is destroyed or Selin's mana is full.
--> Fel Explosion(Spell 44314): Area of effect damage spell, cast continually until Selin is out of mana.
--> Drain Life(Spell 44294): Randomly targeted channeled spell, deals damage and heals Selin. Should be interrupted.

--]]