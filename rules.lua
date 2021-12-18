local rules = {
    "no griefing,",
    "Builds must be 40 blocks away from other builds,",
    "No dating or roleplay,",
    "no all capitals messages,",
    "no spaming,",
    "English in public chat,",
    "No asking admins for privs,",
    "pinging more than twice may result in tempban,",
    "skybuilds/bases are not allowed,",
    "controversial topics(religon and politics) are banned,",
    ",",
    "rules are subject to change,",
    "rules last updated: 8/19/2020,",
    "see /info for more information",
}

local info = {
    "Join our discord at: https://discord.gg/UHjhrAW,",
    "Join our irc at edgy1.net/irc for a web irc client,",
    "Our website: https://wsor4035.github.io/blockcity/bc_home.html,",
    "Server issue tracker: https://github.com/BlockCityCreative/issue-tracker,",
    "Server mods at: https://github.com/BlockCityCreative,",
    "server github account: https://github.com/BlockCityCreative,",
    "info last updated: 8/8/2020",
}

local function formspec_it(title, contents)
    local rules_formspec = {
        "size[8.01,8.7944685466377]",
        "image_button_exit[5.54,8.344169917642;2.605,0.7835;;exit_button;exit]",
        "textlist[0.1,0.10836584308626;7.6,7.8091106290672;" .. title .. ";",
        "BlockCity Rules,",
        ",",
        table.concat(contents, ""),
        ";1;false]",
    }

    return rules_formspec
end

--rules command
minetest.register_chatcommand("rules", {
	params = "",
	description = "Shows BlockCity Rules",
    func = function(name, param)
		if not minetest.get_player_by_name(name) then
            for _, msg in ipairs(rules) do
                minetest.chat_send_player(name, msg)
            end
		    return true
        end
		minetest.show_formspec(name, "bc_rules:rules_formspec", table.concat(formspec_it("rules_text", rules), ""))
	end,
})

--info chat command
minetest.register_chatcommand("info", {
	params = "",
	description = "Shows BlockCity Info",
	func = function(name, param)
        if not minetest.get_player_by_name(name) then
            for _, msg in ipairs(info) do
                minetest.chat_send_player(name, msg)
            end
		    return true
        end
		minetest.show_formspec(name, "bc_rules:info_formspec", table.concat(formspec_it("info_text", info), ""))
	end,
})

minetest.register_on_newplayer(function(ObjectRef)
    local pname = ObjectRef:get_player_name()
    minetest.show_formspec(pname, "bc_rules:rules_formspec", table.concat(formspec_it("rules_text", rules), ""))

    --hack to make sure new players get interact
    local function gi()
        if minetest.get_player_by_name(pname) then
            local privs = minetest.get_player_privs(pname)
            privs["interact"] = true
            minetest.set_player_privs(pname, privs)
        end
    end

    minetest.after(0, gi)
end)