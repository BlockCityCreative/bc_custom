--perhaps make this load from modstorage?
local spawnOut = {x=2025,y=7,z=161}

minetest.register_chatcommand("spawnout", {
    params = "<name>",
    description = "adds a command to tp players to spawn out",
    privs = {teleport=true},
    func = function(name,param)
        if not minetest.get_player_by_name(param) then
            minetest.chat_send_player(name, "sorry, player ".. param .." does not appear to be ingame and/or exist")
        else
            minetest.get_player_by_name(param):set_pos(spawnOut)
        end
    end
})