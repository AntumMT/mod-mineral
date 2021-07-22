
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
--  @setting mineral.source
--  @settype string
--  @default default:stone
mineral.source = core.settings:get("mineral.source") or "default:stone"
