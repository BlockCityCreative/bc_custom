local rules = "no griefing,"..
"Builds must be 40 blocks away from other builds,"..
"No dating or roleplay,"..
"no all capitals messages,"..
"no spaming,"..
"English in public chat,"..
"No asking admins for privs,"..
"pinging more than twice may result in tempban,"..
"skybuilds/bases are not allowed,"..
"controversial topics(religon and politics) are banned,"..
","..
"rules are subject to change,"..
"rules last updated: 8/19/2020,"..
"see /info for more information"

local info = "Join our discord at: https://discord.gg/UHjhrAW,"..
"Join our irc at edgy1.net/irc for a web irc client,"..
"Our website: https://wsor4035.github.io/blockcity/bc_home.html,"..
"Server issue tracker: https://github.com/BlockCityCreative/issue-tracker,"..
"Server mods at: https://github.com/BlockCityCreative,"..
"server github account: https://github.com/BlockCityCreative,"..
"info last updated: 8/8/2020"

local rules_formspec =
"size[8.01,8.7944685466377]"..
"image_button_exit[5.54,8.344169917642;2.605,0.7835;;exit_button;exit]"..
"textlist[0.1,0.10836584308626;7.6,7.8091106290672;rules_text;"..
"BlockCity Rules,"..
","..rules..";1;false]"

local function split(s, sep)
	local fields = {}

	local sep = sep or " "
	local pattern = string.format("([^%s]+)", sep)
	string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)

	return fields
end

local splitRules = split(rules,",")
local splitInfo = split(info, ",")

--rules command
minetest.register_chatcommand("rules", {
	params = "",
	description = "Shows BlockCity Rules",
	func = function(name, param)
						if not minetest.get_player_by_name(name) then
							for k in pairs(splitRules) do
								minetest.chat_send_player(name,splitRules[k])
							end
							return true
						end
						minetest.show_formspec(name, "bc_rules:rules_formspec", rules_formspec)
	end,
})

--info chat command
minetest.register_chatcommand("info", {
	params = "",
	description = "Shows BlockCity Rules",
	func = function(name, param)

				if not minetest.get_player_by_name(name) then
						for k in pairs(splitInfo) do
								minetest.chat_send_player(name,splitInfo[k])
						end
						return true
				end
        info_formspec =
        "size[8.01,8.7944685466377]"..
        "image_button_exit[5.54,8.344169917642;2.605,0.7835;;exit_button;exit]"..
        "textlist[0.1,0.10836584308626;7.6,7.8091106290672;info_text;"..
        "BlockCity info,"..
        ","..
				info..
				";1;false]"

				minetest.show_formspec(name, "bc_rules:info_formspec", info_formspec)

				return true
	end,
})

minetest.register_on_newplayer(function(ObjectRef)
    local pname = ObjectRef:get_player_name()
    minetest.show_formspec(pname, "bc_rules:rules_formspec", rules_formspec)
end
)