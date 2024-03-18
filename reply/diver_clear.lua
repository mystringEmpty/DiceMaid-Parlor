msg_reply.group_diver_clear = {
    keyword = { match="清理潜水" },
    limit = {
        grp_id = { nor = 0 },
        user_var = { trust = { more = 4 } }
    },
    echo = function()
        loadLua("group.kick_diver")(msg)
        return "{group_diver_clear}"
    end
}