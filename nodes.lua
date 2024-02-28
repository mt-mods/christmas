
local function register_present(name, description, color)
	minetest.register_node("christmas:present_"..name, {
		description = description .." Christmas Present",
		tiles = {
			"christmas_present.png^[colorize:#" ..color.. "^christmas_bow_top.png",
			"christmas_present.png^[colorize:#" ..color.. "^christmas_bow_bottom.png",
			"christmas_present.png^[colorize:#" ..color.. "^christmas_bow_side.png"
		},
		groups = {crumbly = 3, present = 1, not_in_creative_inventory = 1},
		is_ground_content = false,
		drop = "",
		can_dig = function(pos)
			local item = christmas.loot[math.random(#christmas.loot)]
			minetest.add_item(pos, item)
			minetest.remove_node(pos)
			return false
		end
	})
end

for _,colour in pairs(christmas.present_colours) do
	register_present(colour.name, colour.description, colour.code)
end
