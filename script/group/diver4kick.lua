--local size_default = 31
local function list_diver(gid,size)
    --local siz_diver = size or size_default
    local siz_diver = size or (50+getGroupConf(gid,"size")-getGroupConf(gid,"maxsize"))
    if siz_diver<=0 then return {} end
    local tab_lst = getGroupConf(gid,"members","lst")
    local ary_rank = {}
    local lst_line = os.time() - 86400*30
    for uid,lst in pairs(tab_lst)do
        if lst>lst_line then goto continue end
        local idx=1
        for i,data in ipairs(ary_rank) do
            if data.val>=lst or i>siz_diver then
                break
            end
            idx = i+1
        end
        if idx<siz_diver then
            table.insert(ary_rank,idx,{id=uid,val=lst})
            if #ary_rank >siz_diver then
                table.remove(ary_rank)
            end
        elseif idx==siz_diver then
            ary_rank[siz_diver] = {id=uid,val=lst}
        end
        :: continue ::
    end
    return ary_rank
end
return list_diver