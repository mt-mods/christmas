
local function register_present(name, description, colorCode)
	minetest.register_node("christmas:present_"..name, {
	  description = description .." Christmas Present",
	  tiles = {
	    "christmas_present.png^[colorize:#" ..colorCode.. "^christmas_bow_top.png",
	    "christmas_present.png^[colorize:#" ..colorCode.. "^christmas_bow_bottom.png",
	    "christmas_present.png^[colorize:#" ..colorCode.. "^christmas_bow_side.png"
		},
	  groups = {
			crumbly=3,
			not_in_creative_inventory=1
		}
	})
end

colours = {
	-- RGB Prime Colours --
	{name="red", code="FF000099", description="Red", dye="red"},
	{name="green", code="00FF0099", description="Green", dye="green"},
	{name="blue", code="0000FF99", description="Blue", dye="blue"},
	-- RGB Secondary Colour --
	{name="yellow", code="FFFF0099", description="Yellow", dye="yellow"},
	{name="magenta", code="FF00FF99", description="Magenta", dye="magenta"},
	{name="cyan", code="00FFFF99", description="Cyan", dye="cyan"}
}

for i,colour in ipairs(colours) do
	register_present(colour.name, colour.description, colour.code)
end
