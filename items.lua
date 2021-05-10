
local S = core.get_translator(mineral.modname)


local items = {
	{
		name            = "coal_lump",
		description     = S("Coal Lump"),
	  inventory_image = "mineral_coal_lump.png",
	  groups          = {coal=1, flammable=1,},
	},
	{
		name            = "copper_lump",
		description     = S("Copper Lump"),
		inventory_image = "mineral_copper_lump.png",
	},
	{
		name            = "diamond",
		description     = S("Diamond"),
		inventory_image = "mineral_diamond.png",
	},
	{
		name            = "gold_lump",
		description     = S("Gold Lump"),
		inventory_image = "mineral_gold_lump.png",
	},
	{
		name            = "iron_lump",
		description     = S("Iron Lump"),
		inventory_image = "mineral_iron_lump.png",
	},
	{
		name            = "tin_lump",
		description     = S("Tin Lump"),
		inventory_image = "mineral_tin_lump.png"
	},
}

for _, new_item in ipairs(items) do
	if mineral.replace_default then
		new_item.replaces = "default:" .. new_item.name
	end

	new_item.name = "mineral:" .. new_item.name
	mineral.register({item=new_item,})
end
