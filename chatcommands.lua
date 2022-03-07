------------------
--short commands--
------------------

if minetest.get_modpath("areas") then
    minetest.register_chatcommand("a1", minetest.chatcommands["area_pos1"])
    minetest.register_chatcommand("a2", minetest.chatcommands["area_pos2"])
    minetest.register_chatcommand("p", minetest.chatcommands["protect"])
end

if minetest.get_modpath("catcommands") then
    minetest.register_chatcommand("v", minetest.chatcommands["vanish"])
end

if minetest.get_modpath("xban2") then
    minetest.register_chatcommand("yeet", minetest.chatcommands["xban"])
end

-----------------
--chat commands--
-----------------

--perhaps make this load from modstorage?
--local spawnOut = {x=2025,y=7,z=161}

local location = {
    old_spawnout = {x=2025, y=7, z=161},
    old_spawn = {x=4018.0, y=-27, z=-4190},
    space_spawn = {x=-176, y=20076, z=458},
    spawn = {x=1964.5, y=0, z=-45.5},
}

minetest.register_chatcommand("visit", {
    params = "<location>",
    description = "type a location to visit",
    func = function(name, param)
        if location[param] and minetest.get_player_by_name(name) then
            minetest.chat_send_player(name, "Teleporting to " .. param)
            minetest.get_player_by_name(name):set_pos(location[param])
        elseif not minetest.get_player_by_name(name) then
            minetest.chat_send_player(name, "sorry, you do not appear to be in game")
        else
            minetest.chat_send_player(name, "'" .. param .. "' is not a valid location to visit")
        end
    end
})

--[[
minetest.register_chatcommand("spawnout", {
    params = "<name>",
    description = "adds a command to tp players to spawn out",
    privs = {teleport=true},
    func = function(name,param)
        if param == "" then
            minetest.chat_send_player(name, "Teleporting " .. name .. " to spawnout")
            minetest.get_player_by_name(name):set_pos(spawnOut)
        elseif not minetest.get_player_by_name(param) then
            minetest.chat_send_player(name, "sorry, player ".. param .." does not appear to be ingame and/or exist")
        else
            minetest.chat_send_player(name, "Teleporting " .. param .. " to spawnout")
            minetest.get_player_by_name(param):set_pos(spawnOut)
        end
    end
})
--]]
