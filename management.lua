local storage = minetest.get_mod_storage()

christmas.is_christmas = storage:get_int("christmas") == 1

minetest.register_chatcommand("christmas_toggle", {
	description = "toggles the christmas mode",
	privs = {server=true},
	func = function(name)
		christmas.is_christmas = not christmas.is_christmas

		local txt = "enabled"
		if not christmas.is_christmas then
			txt = "disabled"
			storage:set_int("christmas", 0)
		else
			storage:set_int("christmas", 1)
		end

		minetest.log("warning", "Player " .. name .. " toggle christmas mode, new mode: " .. txt)

		return true, "Christmas: " .. txt
	end
})
