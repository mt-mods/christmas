minetest.register_node("christmas_craft:Christmas_present_"..name, {
  description = description .." Christmas Present",
  tiles = {
    "christmas_present.png^[colorize:#" ..colorCode.. "^christmas_bow_top.png",
    "christmas_present.png^[colorize:#" ..colorCode.. "^christmas_bow_bottom.png",
    "christmas_present.png^[colorize:#" ..colorCode.. "^christmas_bow_side.png"},
  is_ground_content = true,
  groups = {crumbly=3},
  drop = {
    max_items = 1, min_items = 1, items = {
      {items = {'default:bookshelf'},	rarity = 90,},
      {items = {'default:pick_mese'},	rarity = 80,},
      {items = {'default:shovel_steel'},	rarity = 90,},
      {items = {'default:axe_steel'},	rarity = 90,},
      {items = {'default:pick_steel'},	rarity = 90,},
      {items = {'default:sign_wall'},	rarity = 80,},
      {items = {'default:chest'},	rarity = 80,},
      {items = {'default:furnace'},	rarity = 80,},
      {items = {'default:steelblock'},	rarity = 80,},
      {items = {'default:coal_lump'},	rarity = 80,},
      {items = {'default:pick_diamond'},	rarity = 75,},
      {items = {'default:shovel_diamond'},	rarity = 75,},
      {items = {'default:axe_diamond'},	rarity = 75,},
      {items = {'default:diamondblock'},	rarity = 75},
      {items = {'fake_fire:flint_and_steel'},	rarity = 90,},
      {items = {'default:chest_locked'},	rarity = 80,},
      {items = {'default:brick'},	rarity = 80,},
      {items = {'default:dirt_with_grass'}, rarity = 80,},
    }},
  sounds = default.node_sound_dirt_defaults({
    footstep = {name="default_grass_footstep", gain=0.4},
  }),
})


colours = {
	-- RGB Prime Colours --
	{name="red", code="FF000099", description="Red", dye="red"},
	{name="green", code="00FF0099", description="Green", dye="green"},
	{name="blue", code="0000FF99", description="Blue", dye="blue"},
	-- RGB Secondary Colour --
	{name="yellow", code="FFFF0099", description="Yellow", dye="yellow"},
	{name="magenta", code="FF00FF99", description="Magenta", dye="magenta"},
	{name="cyan", code="00FFFF99", description="Cyan", dye="cyan"},
	-- RGB Other Colours --
	{name="orange", code="E5940099", description="Orange", dye="orange"},
	{name="darkgreen", code="004C0099", description="Dark Green", dye="dark_green"},
	{name="violet", code="80008099", description="Violet", dye="purple"},
	{name="pink", code="FFC0CB99", description="Pink", dye="pink"},
	{name="brown", code="732c0b99", description="Brown", dye="brown"},
	-- MonoChrome --
	{name="white", code="FFFFFF99", description="White", dye="white"},
	{name="grey", code="80808099", description="Grey", dye="grey"},
	{name="darkgrey", code="14141499", description="Dark Grey", dye="dark_grey"}
}

for i,colour in ipairs(colours) do
	register_present(colour.name, colour.description, colour.code, colour.dye)
  register_baubles(colour.name, colour.description, colour.code, colour.dye)
  register_paper(colour.name, colour.description, colour.code, colour.dye)
	-- register whatever here
end
