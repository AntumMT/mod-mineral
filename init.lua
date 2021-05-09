
mineral = {}
mineral.modname = core.get_current_modname()
mineral.modpath = core.get_modpath(mineral.modname)

dofile(mineral.modpath .. "/api.lua")
