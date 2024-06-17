function values(a)
    local i =0
    return function ()
        i=i+1;
        return a[i],i end
end

tab={10,20,30}
-- iter = values(tab)
-- while true do
--     local e = iter()
--     if e == nil then
--         break end
--     print(e)
-- end

--泛型for
for e,k in  values(tab) do
    print(k..":"..e)
end
