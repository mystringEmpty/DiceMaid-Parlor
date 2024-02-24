msg_reply.group_diver_clear = {
    keyword = { match="清理潜水" },
    limit = {
        grp_id = { nor = 0 },
        user_var = { trust = { more = 4 } }
    },
    echo = function()
        local gid = msg.gid
        loadLua("group.kick_diver")(gid)
        msg.cntDiver = #ary_id
        return "{group_diver_clear}"
    end
}