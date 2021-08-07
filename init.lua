local modpath = minetest.get_modpath("bc_custom")
dofile(modpath .. "/dev.lua")
dofile(modpath .. "/rules.lua")
dofile(modpath .. "/chatcommands.lua")

minetest.override_item('', {wield_image = 'wieldhand.png'})