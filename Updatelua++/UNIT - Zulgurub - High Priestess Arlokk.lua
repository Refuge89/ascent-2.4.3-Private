--[[ UNIT - Zulgurub - High Priestess Arlokk.lua

********************************
*                                                            *
* The Moon++ Scripting Project        *
*                                                            *
********************************

This software is provided as free and open source by the
staff of The Moon++ Scripting Project, in accordance with 
the GPL license. This means we provide the software we have 
created freely and it has been thoroughly tested to work for 
the developers, but NO GUARANTEE is made it will work for you 
as well. Please give credit where credit is due, if modifying,
redistributing and/or using this software. Thank you.

Staff of The Moon++ Scripting Project, November 2007
~~End of License Agreement

All credits for the files in this folder that are GameMonkey scripts
go to the GMScripts project, for all their hard work for the Ascent 
community.

-- Moon++ Project, November 2007 ]]

function Arlokk_Combat (pUnit, Event)
	pUnit:SendChatMessage (12, 0, "Bethekk, your priestess calls upon your might!")
	pUnit:PlaySoundToSet (8416)
end
RegisterUnitEvent (14515, 6, "Arlokk_Combat")

function Arlokk_Despawn (pUnit, Event)
	pUnit:Despawn (0, 0)
end
RegisterUnitEvent (14515, 2, "Arlokk_Despawn")

function Arlokk_Death (pUnit, Event)
	pUnit:SendChatMessage (12, 0, "At last, I am free of the Soulflayer!")
	pUnit:PlaySoundToSet (8412)
end
RegisterUnitEvent (14515, 4, "Arlokk_Death") 