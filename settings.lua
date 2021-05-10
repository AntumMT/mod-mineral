
--- Settings
--
--  @module settings.lua


--- Replace nodes specified in `MineralDef.replace`
--
--  @setting mineral.replace_default
--  @settype bool
--  @default true
mineral.replace_default = core.settings:get_bool("mineral.replace_default", true)
