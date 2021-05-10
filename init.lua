
mineral = {}
mineral.modname = core.get_current_modname()
mineral.modpath = core.get_modpath(mineral.modname)

mineral.log = function(lvl, msg)
	if not msg then
		msg = lvl
		lvl = nil
	end

	msg = "[" .. mineral.modname .. "] " .. msg

	if lvl then
		core.log(lvl, msg)
	else
		core.log(msg)
	end
end


local scripts = {
	"settings",
	"api",
	"items",
	"nodes",
	"ores",
	"crafts",
}

for _, script in ipairs(scripts) do
	dofile(mineral.modpath .. "/" .. script .. ".lua")
end
