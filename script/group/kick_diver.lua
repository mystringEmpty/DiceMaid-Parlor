local function kick_diver(eve)
    local gid = eve.gid
    local list = loadLua("group.diver4kick")(gid)
    if #list==0 then log("群"..gid.."获取潜水列表为空",1) end
    local ary_id = {}
    local ary_at_days = {}
    local now = os.time()
    for i,data in ipairs(list)do
        table.insert(ary_id,data.id)
        table.insert(ary_at_days,"[CQ:at,id="..data.id.."] "..string.format("%.0f",(now-data.val)/86400) .."天")
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
    eve.cntDiver = #ary_id
end
return kick_diver