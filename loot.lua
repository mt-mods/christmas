
local function register_loot(name, count)
	if minetest.registered_items[name] then
		table.insert(christmas.loot, { name=name, count=count })
	end
end

minetest.register_on_mods_loaded(function()
	register_loot("default:gold_lump", 5)
	register_loot("default:copper_lump", 5)
	register_loot("default:clay_lump", 5)
	register_loot("default:iron_lump", 5)
	register_loot("default:tin_lump", 5)
	register_loot("default:gold_ingot", 5)
	register_loot("default:goldblock", 1)
	register_loot("default:diamondblock", 1)
	register_loot("default:diamond", 5)
	register_loot("default:mese", 1)
	register_loot("default:mese_crystal", 5)
	register_loot("default:mese_crystal_fragment", 5)

	register_loot("homedecor:bed_kingsize", 1)
	register_loot("homedecor:beer_tap", 1)
	register_loot("homedecor:alarm_clock", 1)
	register_loot("homedecor:barbecue", 1)
	register_loot("homedecor:dishwasher_marble", 1)
	register_loot("homedecor:kitchen_chair_padded", 1)
	register_loot("homedecor:piano", 1)
	register_loot("homedecor:oven", 1)
	register_loot("homedecor:stereo", 1)
	register_loot("homedecor:toaster", 1)
	register_loot("homedecor:washing_machine", 1)
	register_loot("lrfurn:longsofa", 1)
	register_loot("computer:tetris_arcade", 1)

	register_loot("mobs_xenomorph:xenomorph", 1)

	register_loot("lavastuff:ingot", 5)

	register_loot("currency:minegeld_100", 1)
	register_loot("currency:minegeld_10", 5)
	register_loot("currency:minegeld_5", 10)
	register_loot("currency:minegeld", 50)

	register_loot("ethereal:banana", 1)
	register_loot("ethereal:orange", 1)
	register_loot("ethereal:strawberry", 1)

	register_loot("technic:mithril_protected_chest", 1)
	register_loot("technic:prospector", 1)
	register_loot("technic:mining_drill", 1)
	register_loot("technic:chainsaw", 1)
	register_loot("technic:mv_freezer", 1)
	register_loot("technic:solar_panel", 1)

	register_loot("advtrains:dtrack_placer", 30)

	register_loot("3d_armor:boots_mithril", 1)
	register_loot("3d_armor:chestplate_mithril", 1)
	register_loot("3d_armor:helmet_mithril", 1)
	register_loot("3d_armor:leggings_mithril", 1)
	register_loot("shields:shield_mithril", 1)

	register_loot("multitools:multitool_mithril", 1)
end
