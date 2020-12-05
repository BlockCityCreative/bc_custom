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