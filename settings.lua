
--- Settings
--
--  @module settings.lua


--- Replace nodes specified in `MineralDef.replace`
--
--  @setting mineral.replace_default
--  @settype bool
--  @default false
mineral.replace_default = core.settings:get_bool("mineral.replace_default", false)

--- The node wherein minerals will appear.
--
--  @setting mineral.ore_source
--  @settype string
--  @default default:stone
mineral.ore_source = core.settings:get("mineral.ore_source") or "default:stone"

--- Underlay texture used for ore nodes.
--
--  @setting mineral.ore_underlay
--  @settype string
--  @default default_stone.png
mineral.ore_underlay = core.settings:get("mineral.ore_underlay") or "default_stone.png"
