-- --number
-- local numTest1 = 5
-- local numTest2 = numTest1 
-- numTest2 = 10
-- print(numTest1)

-- --string
-- local strTest1 = "Hello World!"
-- local strTest2 = strTest1
-- strTest2 = "Hello China!"
-- print(strTest1)

-- --table
-- local tblTest1 = {a=1, b=2 , c=3}
-- local tblTest2 = tblTest1
-- tblTest2.b = 99
-- print(tblTest1.b)

-- Lua table deep copy
-- function clone(object)
--     local lookup_table={}
--     local function  _copy(object)
       
--         if type(object) ~="table" then
--             return object
--         elseif lookup_table[object] then
            
--             return lookup_table[object]
--         end
       
--         local new_table ={}
--         lookup_table[object] = new_table
--         for key, value in pairs(object) do
--             new_table[_copy(key)] = _copy(value)
--         end
--         return setmetatable(new_table,getmetatable(object))
        
--     end
--     return _copy(object)
-- end

-- --test

-- local deepCopyTest1={a=1,b=2,c=3}
-- local deepCopyTest2=clone(deepCopyTest1)
-- deepCopyTest2.b=99
-- print(deepCopyTest1.b)

-- tabB = tabA ，相当于是对象起别名，或者说赋值指针，tabA的任何改动也会实装在tabB上
-- lookup_table相当于一个记忆表，里面的key为table的地址，这样可以保证每一个key都是唯一的，
--里面只包含，一个是要深拷贝的tabA，另外是tabA的里面的域为table 的。自己里面的属性是自己，要防止死循环
-- _copy里面执行逻辑，如果复制的是值，直接返回，如果复制的是表，在记忆表里找，没找到，接着创建一个新表。
-- 表里有表，就是执行_copy(v)时，进行递归，直到返回一个塞好的新newTab1

function DeepCopy(object)
    -- 已经复制过的table，key为复制源table，value为复制后的table
    -- 为了防止table中的某个属性为自身时出现死循环
    -- 避免本该是同一个table的属性，在复制时变成2个不同的table(内容同，但是地址关系和原来的不一样了)
    local lookup_table = {}
    local function _copy(object)
     
        if type(object) ~= 'table' then -- 非table类型都直接返回
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end 
        local new_table = {}
        lookup_table[object] = new_table
        for k,v in pairs(object) do
            new_table[_copy(k)] = _copy(v)
            print(new_table[_copy(k)])
            print(_copy(v))
        end 
        -- 这里直接拿mt来用是因为一般对table操作不会很粗暴的修改mt的相关内容
        return setmetatable(new_table, getmetatable(object))
    end 
    return _copy(object)                    
end
tabA = { x= 1}
tabB = tabA
print(tabB.x) --1
tabA.x = 2
print(tabB.x) --2
tabC = DeepCopy(tabA)

print(tabC.x) --2

tabA.x = 3

print(tabC.x) --2

-- 我们如果传进去的对象不是表类型的话，那么我们就会直接把这个值return出去，
-- 然后再利用=号进行一次浅拷贝，上文提过如果是数值类型的话，浅拷贝也会生成一个对象。
-- 那么如果如果传的object是一个表类型的话，则递归去把object中的key， value复制到一个新创建的表中，
-- 最后再把object的元表设置成新表的元表。这样就完成了整个深克隆的过程了。
