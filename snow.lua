
local function do_snow(player)
	local ppos = player:get_pos()
	local player_name = player:get_player_name()

	minetest.add_particlespawner({
		amount = 200,
		time = 5,
		minpos = vector.add(ppos, {x=-20, y=-5, z=-20}),
		maxpos = vector.add(ppos, {x=20, y=15, z=20}),
		minvel = {x=0, y=-2, z=0},
		maxvel = {x=0, y=-2, z=0},
		minacc = {x=0, y=0, z=0},
		maxacc = {x=0, y=0, z=0},
		minexptime = 5,
		maxexptime = 5,
		minsize = 50,
		maxsize = 70,
		vertical = true,
		texture = "christmas_snow.png",
		playername = player_name
	})
end

local function can_snow(player)
	local ppos = player:get_pos()

	local pos1 = vector.subtract(ppos, {x=20, y=5, z=20})
	local pos2 = vector.add(ppos, {x=20, y=5, z=20})

	local nodes = minetest.find_nodes_in_area(pos1, pos2, {"default:dirt_with_snow", "default:snowblock"})
	return #nodes > 10
end

local timer = 0
minetest.register_globalstep(function(dtime)
	if not christmas.is_christmas then
		return
	end

	timer = timer + dtime
	if timer < 3 then
		return
	end
	timer = 0

	for _, player in ipairs(minetest.get_connected_players()) do
		if can_snow(player) then
			do_snow(player)
		end
	end
end)
