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

-----------------
--chat commands--
-----------------

--perhaps make this load from modstorage?
local spawnOut = {x=2025,y=7,z=161}

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