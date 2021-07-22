
local S = core.get_translator(mineral.modname)


-- FIXME: depends on sounds & textures from default
local stone_texture = "default_stone.png"
local snd = {
	stone = sounds.node_stone(),
}

local nodes = {
	{
		name        = "stone_with_coal",
		description = S("Coal Ore"),
		tiles       = {stone_texture .. "^mineral_overlay_coal.png"},
		groups      = {cracky = 3},
		drop        = "mineral:coal_lump",
		sounds      = snd.stone,
	},
	{
		name        = "stone_with_copper",
		description = S("Copper Ore"),
		tiles       = {stone_texture .. "^mineral_overlay_copper.png"},
		groups      = {cracky = 2},
		drop        = "mineral:copper_lump",
		sounds      = snd.stone,
	},
	{
		name        = "stone_with_diamond",
		description = S("Diamond Ore"),
		tiles       = {stone_texture .. "^mineral_overlay_diamond.png"},
		groups      = {cracky = 1},
		drop        = "mineral:diamond",
		sounds      = snd.stone,
	},
	{
		name        = "stone_with_gold",
		description = S("Gold Ore"),
		tiles       = {stone_texture .. "^mineral_overlay_gold.png"},
		groups      = {cracky = 2},
		drop        = "mineral:gold_lump",
		sounds      = snd.stone,
	},
	{
		name        = "stone_with_iron",
		description = S("Iron Ore"),
		tiles       = {stone_texture .. "^mineral_overlay_iron.png"},
		groups      = {cracky = 2},
		drop        = "mineral:iron_lump",
		sounds      = snd.stone,
	},
	{
		name        = "stone_with_tin",
		description = S("Tin Ore"),
		tiles       = {stone_texture .. "^mineral_overlay_tin.png"},
		groups      = {cracky = 2},
		drop        = "mineral:tin_lump",
		sounds      = snd.stone,
	},
}


for _, new_node in ipairs(nodes) do
	if mineral.replace_default then
		new_node.replaces = "default:" .. new_node.name
	end

	new_node.name = "mineral:" .. new_node.name
	mineral.register({node=new_node,})
end
