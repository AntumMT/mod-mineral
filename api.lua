
--- Main functions for mineral registration
--
--  @module api.lua


local disabled_minerals = {}

--- Checks if a mineral type is disabled.
--
--  @tparam string mname Mineral name.
function mineral.is_disabled(mname)
	return disabled_minerals[mname] == true
end

--- Registers a new craft item.
--
--  @function mineral.register_item
--  @tparam ItemDef def Item definition.
function mineral.register_item(def)
	local replaces = def.replaces
	def.replaces = nil
	local name = def.name
	def.name = nil

	local log_msg = "Registering item " .. name
	if replaces then
		log_msg = log_msg .. " to replace " .. replaces
	end
	mineral.log("action", log_msg)

	core.register_craftitem(name, def)
	if replaces and core.registered_items[replaces] then
		core.unregister_item(replaces)
		core.register_alias(replaces, name)
	end
end

--- Registers a new node.
--
--  @function mineral.register_node
--  @tparam NodeDef def Node definition.
function mineral.register_node(def)
	local replaces = def.replaces
	def.replaces = nil
	local name = def.name
	def.name = nil

	local log_msg = "Registering node " .. name
	if replaces then
		log_msg = log_msg .. " to replace " .. replaces
	end
	mineral.log("action", log_msg)

	core.register_node(name, def)
	if replaces and core.registered_nodes[replaces] then
		core.register_lbm({
			name = mineral.modname .. ":replace_node_" .. replaces,
			nodenames = {replaces},
			run_at_every_load = true,
			action = function(pos)
				core.swap_node(pos, core.registered_nodes[name])
			end,
		})

		core.unregister_item(replaces)
		core.register_alias(replaces, name)
	end
end

--- Registers a new ore.
--
--  @function mineral.register_ore
--  @tparam OreDef def Ore definition.
function mineral.register_ore(def)
	local replaces = def.replaces
	def.replaces = nil
	local name = def.ore

	local log_msg = "Registering ore " .. name
	if replaces then
		log_msg = log_msg .. " to replace " .. replaces
	end
	mineral.log("action", log_msg)

	core.register_ore(def)
	if replaces then
		local registered_ids = {}
		for id, v in pairs(core.registered_ores) do
			if v.ore == replaces then
				table.insert(registered_ids, id)
			end
		end

		for _, id in ipairs(registered_ids) do
			core.registered_ores[id] = nil
		end
	end
end

--- Registers a new mineral
--
--  @function mineral.register
--  @tparam MineralDef defs Mineral definition
function mineral.register(defs)
	if defs.item then
		mineral.register_item(defs.item)
	end
	if defs.node then
		mineral.register_node(defs.node)
	end
	if defs.ore then
		mineral.register_ore(defs.ore)
	end
end


--- Definition Tables
--
--  @section definition_tables


--- Mineral Definition
--
--  @table MineralDef
--  @tfield[opt] ItemDef item Item definition.
--  @tfield[opt] NodeDef node Node definition.
--  @tfield[opt] OreDef ore Ore definition.

--- Item Definition
--
--  Same as definition for [minetest.register_craftitem](https://minetest.gitlab.io/minetest/definition-tables/#item-definition)
--  except also requires ***name*** field. Can optionally contain
--  ***replaces*** field to register this item as a replacement
--  for another.
--
--  Example:
--      {
--        name            = "mineral:iron_lump",
--        description     = "Iron Lump",
--        inventory_image = "mineral_iron_lump.png",
--        replaces        = "default:iron_lump",
--      }
--
--  FIXME: *replaces* should optionally be table value.
--
--  @table ItemDef

--- Node Definition
--
--  Same as definition used for [minetest.register_node](https://minetest.gitlab.io/minetest/definition-tables/#node-definition)
--  except also requires ***name*** field. Can optionally contain
--  ***replaces*** field to register this node as a replacement
--  for another.
--
--  Example:
--      {
--        name        = "mineral:stone_with_iron",
--        description = "Iron Ore",
--        tiles       = {"default_stone.png^mineral_overlay_iron.png"},
--        groups      = {cracky = 2},
--        drop        = "mineral:iron_lump",
--        sounds      = default.node_sound_stone_defaults(),
--        replaces    = "default:stone_with_iron",
--      }
--
--  FIXME: *replaces* should optionally be table value.
--
--  @table NodeDef

--- Ore Definition
--
--  Same as definition used for [minetest.register_ore](https://minetest.gitlab.io/minetest/definition-tables/#ore-definition).
--  Can optionally contain ***replaces*** field to register
--  this ore as a replacement for another.
--
--  Example:
--      {
--        ore_type       = "scatter",
--        ore            = "mineral:stone_with_iron",
--        wherein        = "default:stone",
--        clust_scarcity = 9 * 9 * 9,
--        clust_num_ores = 12,
--        clust_size     = 3,
--        y_max          = 31000,
--        y_min          = 1025,
--        replaces       = "default:stone_with_iron",
--      }
--
--  FIXME: *replaces* should optionally be table value.
--
--  @table OreDef
