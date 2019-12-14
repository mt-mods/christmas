
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
			present=1,
			not_in_creative_inventory=1
		},

		drop = "",

		can_dig = function(pos)
			local item = christmas.loot[math.random(1, #christmas.loot)]
			minetest.add_item(pos, item)
			return true
		end
	})
end

for i,colour in ipairs(christmas.present_colours) do
	register_present(colour.name, colour.description, colour.code)
end
