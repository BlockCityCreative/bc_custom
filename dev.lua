minetest.register_privilege("dev", {
    description = "use dev commands and things",
    give_to_singleplayer = false,
})

minetest.register_chatcommand("xcheck", {
    params = "<modname>",
    description = "Send text to chat",
    privs = {dev = true},
    func = function(name, param)
        if param == "all" then
            local counter = 0

            for node, _ in pairs(minetest.registered_nodes) do
                counter = counter + 1
            end

            minetest.chat_send_player(name, "total registered nodes is: " .. counter)
        elseif minetest.get_modpath(param) == nil then
            minetest.chat_send_player(name, param .. " is not a valid installed mod")
        else
            local counter = 0

            for node, _ in pairs(minetest.registered_nodes) do
                if minetest.registered_nodes[node].mod_origin == param then
                    counter = counter + 1
                end
            end

            minetest.chat_send_player(name, "mod " .. param .. " has " .. counter .. " nodes")
        end
	end,
})

minetest.register_chatcommand("whereis", {
    params = "<player name>",
    description = "get cords of player",
    privs = {dev = true},
    func = function(name, param)
        if not minetest.get_player_by_name(param) then
            return minetest.chat_send_player(name, param .. " is not online")
        else
            local player_pos = minetest.get_player_by_name(param):get_pos()
            minetest.chat_send_player(name, param .. " is at " .. minetest.pos_to_string(player_pos, 0))
        end
    end
})

minetest.register_chatcommand('mute', {
    description = "gives a fun reply",
    params = '<player name>',
    privs = {dev=true},
    func = function (name, params)
        if params == "" then
            minetest.chat_send_player(name, "expected name")
            return false
        else
            minetest.chat_send_all(params .. " shaddup mate")
            return true
        end
    end
})