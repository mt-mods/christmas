function swap(array, index1, index2)
    array[index1], array[index2] = array[index2], array[index1]
end

function shuffle(array)
    local counter = #array
    while counter > 1 do
        local index = math.random(counter)
        swap(array, index, counter)
        counter = counter - 1
    end
end

minetest.register_node("christmas:present_spawner", {
	description = "Christmas Present spawner",
	tiles = {
		"default_steel_block.png^christmas_bow_top.png",
		"default_steel_block.png^christmas_bow_bottom.png",
		"default_steel_block.png^christmas_bow_side.png"
	},
	groups = {
		crumbly=3,
		not_in_creative_inventory=1
	},

	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(1)
	end,

	on_timer = function(pos, elapsed)

		local timer = minetest.get_node_timer(pos)
		if christmas.is_christmas then
			-- random interval
			timer:start(math.random(1,10))
		else
			-- fixed interval if not used
			timer:start(30)
			return
		end


		local pos1 = vector.subtract(pos, {x=10, y=10, z=10})
		local pos2 = vector.add(pos, {x=10, y=10, z=10})

		local nodes = minetest.find_nodes_in_area(pos1, pos2, {"group:present"})
		if #nodes > 5 then
			-- too much presents
			return
		end

		nodes = minetest.find_nodes_in_area(pos1, pos2, {"default:dirt_with_snow"})
		shuffle(nodes)

		for _, node_pos in ipairs(nodes) do
			local above_pos = vector.add(node_pos, {x=0, y=1, z=0})
			local above_node = minetest.get_node(above_pos)

			if above_node.name == "air" then
				local place_node_name = "christmas:present_" ..
					christmas.present_colours[math.random(1, #christmas.present_colours)].name
				minetest.add_node(above_pos, { name=place_node_name })
				return
			end
		end

	end
})
