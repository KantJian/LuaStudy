--元方法
-- t = {a=1}

-- mt = {
--     __add = function (a,b)
--         return a.a+b
--     end,
-- }
-- setmetatable(t,mt)

-- print(t+1)

-- __index
-- t = {a=15}
-- mt ={
--     __index ={
--         abc=123,
--         def=456,
--     }
-- }
-- setmetatable(t,mt)
-- print(t["abc"])

--__newindex
-- t={a=15}
-- mt={
--     __newindex = function (t,k,v)
--         rawset(t,k,v)
   
--     end}
--     setmetatable(t,mt)
--     t["abc"]=123
--     print(t["abc"])


-- t= setmetatable({aaa=111} ,{})
-- print(t["aaa"]) -- 访问存在的键
-- print(t.bbb) --访问不存在的键,元表中没有__index键
-- t.ccc=333 -- 给不存在的键赋值,元表中没有__newindex, 会在t中插入ccc键
-- print(t.ccc) -- t 中有了该键
-- print("----------------")

t = setmetatable( {aaa=111,},
{
    __index = function (x,y) print("执行_index",x,y) end,
    __newindex=function (x,v,z) print("执行_newindex",x,y,z) end

}
)
print(t["aaa"]) -- 访问存在的键
print(t.bbb) --访问不存在的键，去元表__index键中找
t.ccc=333 -- 给不存在的键赋值，去元表__newindex键中调用函数
print(t.ccc) -- t中没有，元表中__index键中也没有







