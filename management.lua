
minetest.register_chatcommand("christmas_toggle", {
	description = "toggles the christmas mode",
	privs = {server=true},
	func = function(name)
		christmas.is_christmas = not christmas.is_christmas

		local txt = "enabled"
		if not christmas.is_christmas then
			txt = "disabled"
		end

		minetest.log("warning", "Player " .. name .. " toggle christmas mode, new mode: " .. txt)

		return true, "Christmas: " .. txt
	end
})
