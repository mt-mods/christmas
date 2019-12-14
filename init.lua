christmas = {
	-- toggle with "/christmas_toggle"
	is_christmas = false,

	loot = {}, -- { name="default:stone", count=1 }

	present_colours = {
		-- RGB Prime Colours --
		{name="red", code="FF000099", description="Red", dye="red"},
		{name="green", code="00FF0099", description="Green", dye="green"},
		{name="blue", code="0000FF99", description="Blue", dye="blue"},
		-- RGB Secondary Colour --
		{name="yellow", code="FFFF0099", description="Yellow", dye="yellow"},
		{name="magenta", code="FF00FF99", description="Magenta", dye="magenta"},
		{name="cyan", code="00FFFF99", description="Cyan", dye="cyan"}
	}

}

local MP = minetest.get_modpath("christmas")
dofile(MP.."/management.lua")
dofile(MP.."/nodes.lua")
dofile(MP.."/loot.lua")
dofile(MP.."/present_spawner.lua")
