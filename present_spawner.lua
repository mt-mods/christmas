
minetest.register_node("christmas:present_spawner", {
	description = "Christmas Present spawner",
	tiles = {
		"default_steel_block.png^christmas_bow_top.png",
		"default_steel_block.png^christmas_bow_bottom.png",
		"default_steel_block.png^christmas_bow_side.png"
	},
	groups = {crumbly = 3, not_in_creative_inventory = 1},
	is_ground_content = false,

	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(1)
	end,

	on_timer = function(pos)
		local timer = minetest.get_node_timer(pos)
		if christmas.is_christmas then
			-- random interval
			timer:start(math.random(1,10))
		else
			-- fixed interval if not used
			timer:start(60)
			return
		end

		local pos1 = vector.subtract(pos, {x=10, y=5, z=10})
		local pos2 = vector.add(pos, {x=10, y=5, z=10})

		local nodes = minetest.find_nodes_in_area(pos1, pos2, {"group:present"})
		if #nodes > 5 then
			-- too many presents
			return
		end

		nodes = minetest.find_nodes_in_area_under_air(pos1, pos2, {"default:dirt_with_snow", "default:snowblock"})

		if #nodes > 0 then
			local node_pos = nodes[math.random(#nodes)]
			local above_pos = vector.add(node_pos, {x=0, y=1, z=0})
			local color = christmas.present_colours[math.random(#christmas.present_colours)].name
			local place_node = "christmas:present_" .. color
			minetest.add_node(above_pos, {name = place_node})
		end
	end
})
