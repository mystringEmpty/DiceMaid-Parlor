local function kick_diver(gid)
    local list = loadLua("group.diver4kick")(gid)
    if #list==0 then log("群"..gid.."获取潜水列表为空",1) end
    local ary_id = {}
    local ary_at_days = {}
    local now = os.time()
    for i,data in ipairs(list)do
        table.insert(ary_id,data.id)
        table.insert(ary_id,"[CQ:at,id="..data.id.."] "..(now-data.val)/86400 .."天")
    end
--res = table.concat(ary_id,"\n")
    sendMsg({
        fwdMsg = "{group_diver_notice}",
        li = table.concat(ary_at_days,"\n"),
        gid = gid
    })
    eventMsg({
        fromMsg = ".group "..string.format("%d",gid).." kick "..table.concat(ary_id,"\n"),
        uid = getDiceQQ()
    })
end
return kick_diver