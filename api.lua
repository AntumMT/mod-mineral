--- Main functions for mineral handling
--
--  @module api.lua


--- Registers a new mineral
--
--  @function mineral.register
--  @tparam MineralDef Mineral definition.
function mineral.register(def)
	local ore_def = {}

	if #ore_def > 0 then
		core.register_ore(ore_def)
	end
end
