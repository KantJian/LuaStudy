-- 在加载一个.lua文件时，require会先在package.loaded中
-- 查找此模块是否存在，
-- 如果存在，直接返回模块。

-- test2.lua
-- a = require("test1")
-- print("require res="..tostring(a))
-- print("5!="..Fac(5))
-- require的特点是仅加载一次，
--并且对于模块会按照特定的搜索规则去查找文件并加载。

-- a = loadfile("test1,lua")
-- print("loadfile res="..tostring(a))
-- print("5!="..Fac(5))
-- loadfile：编译代码，将整个模块文件当成一个函数返回，
-- 但是不执行代码。

a = dofile("test1.lua")
print("dofile res="..tostring(a))
print("5!="..Fac(5))
--dofile：读入代码文件并编译执行。每调用dofile一次，都会重新编译执行一次。
