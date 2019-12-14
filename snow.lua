
local function do_snow(player)
  local ppos = player:get_pos()
  local player_name = player:get_player_name()

  minetest.add_particlespawner({
    amount = 250,
    time = 5,
    minpos = vector.add(ppos, {x=-20, y=5, z=-20}),
    maxpos = vector.add(ppos, {x=20, y=10, z=20}),
    minvel = {x=0.5, y=-1, z=0},
    maxvel = {x=1, y=-3, z=0},
    minacc = {x=0, y=0, z=0},
    maxacc = {x=0, y=0, z=0},
    minexptime = 1,
    maxexptime = 5,
    minsize = 20,
    maxsize = 30.7,
    collisiondetection = true,
    collision_removal = true,
    object_collision = true,
    vertical = true,
    texture = "christmas_snow.png",
    playername = player_name
  })
end

local function can_snow(player)
	local ppos = player:get_pos()

	local pos1 = vector.subtract(ppos, {x=20, y=10, z=20})
	local pos2 = vector.add(ppos, {x=20, y=10, z=20})

	local nodes = minetest.find_nodes_in_area(pos1, pos2, {"default:dirt_with_snow"})
	return #nodes > 0
end

local timer = 0
minetest.register_globalstep(function(dtime)
	if not christmas.is_christmas then
		return
	end

	timer = timer + dtime
	if timer < 2 then
		return
	end
	timer=0

  for _, player in ipairs(minetest.get_connected_players()) do
		if can_snow(player) then
			do_snow(player)
		end
  end

end)
