
local S = core.get_translator(mineral.modname)


local ores = {
	-- coal
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_coal",
		wherein        = mineral.source,
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 9,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_coal",
		wherein        = mineral.source,
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -31000,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_coal",
		wherein        = mineral.source,
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = 0,
		y_min          = -31000,
	},

	-- copper
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_copper",
		wherein        = mineral.source,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_copper",
		wherein        = mineral.source,
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -16,
		y_min          = -63,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_copper",
		wherein        = mineral.source,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -31000,
	},

	-- diamond
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_diamond",
		wherein        = mineral.source,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_diamond",
		wherein        = mineral.source,
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -255,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_diamond",
		wherein        = mineral.source,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	},

	-- gold
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_gold",
		wherein        = mineral.source,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_gold",
		wherein        = mineral.source,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_gold",
		wherein        = mineral.source,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	},

	-- iron
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_iron",
		wherein        = mineral.source,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_iron",
		wherein        = mineral.source,
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -255,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_iron",
		wherein        = mineral.source,
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 29,
		clust_size     = 5,
		y_max          = -256,
		y_min          = -31000,
	},

	-- tin
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_tin",
		wherein        = mineral.source,
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_tin",
		wherein        = mineral.source,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -32,
		y_min          = -127,
	},
	{
		ore_type       = "scatter",
		ore            = "mineral:stone_with_tin",
		wherein        = mineral.source,
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -31000,
	},
}


for _, new_ore in ipairs(ores) do
	if mineral.replace_default then
		new_ore.replaces = "default:stone_with_" .. new_ore.ore:gsub("^mineral:stone_with_", "")
	end

	mineral.register({ore=new_ore,})
end
