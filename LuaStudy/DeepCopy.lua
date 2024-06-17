-- copy.lua
--
-- Lua functions of varying complexity to deep copy tables.
--


-- 1. The Problem.
--
-- Here's an example to see why deep copies are useful. Let's
-- say function f receives a table parameter t, and it wants to
-- locally modify that table without affecting the caller.
-- This code fails:
--
--下面是一个示例，以了解为什么深度拷贝很有用。让我们

--假设函数f接收到一个表参数t，它想

--本地修改该表，而不影响调用者。

--此代码失败：
function f(t)
    t.a = 3
   end
   --
   local my_t = {a = 5}
   f(my_t)
   print(my_t.a)  --> 3
   --
   -- This behavior can be hard to work with because, in general,
   -- side effects such as input modifications make it more
   -- difficult to reason about program behavior.
   --这种行为很难处理，因为一般来说，
   
   --输入修改等副作用使
   
   --很难对程序行为进行推理。
   
   -- 2. The easy solution.
   
   function copy1(obj)
       if type(obj) ~= 'table' then return obj end
       local res = {}
       for k, v in pairs(obj) do res[copy1(k)] = copy1(v) end
       return res
   end
   
   -- This functions works well for simple tables. Since it is a
   -- clear, concise function, and since I most often work with
   -- simple tables, this is my favorite version.
   --
   -- There are two aspects this does not handle:
   -- * metatables
   -- * recursive tables
   --此函数适用于简单表。因为它是
   
   --清晰、简洁的功能
   
   --简单的表格，这是我最喜欢的版本。
   
   --
   
   --有两个方面没有处理：
   
   --*元表
   
   --*递归表
   
   
   -- 3. Adding metatable support.
   
   function copy2(obj)
       if type(obj) ~= 'table' then return obj end
       local res = setmetatable({}, getmetatable(obj))
       for k, v in pairs(obj) do res[copy2(k)] = copy2(v) end
       return res
   end
   
   -- Well, that wasn't so hard.
   
   
   -- 4. Supporting recursive structures.
   --
   -- The issue here is that the following code will call itself
   -- indefinitely and ultimately cause a stack overflow:
   --这里的问题是以下代码将调用自身
   
   --无限期并最终导致堆栈溢出：
   -- 
   -- local my_t = {}
   -- my_t.a = my_t
   -- local t_copy = copy2(my_t)
   --
   -- This happens to both copy1 and copy2, which each try to make
   -- a copy of my_t.a, which involves making a copy of my_t.a.a,
   -- which involves making a copy of my_t.a.a.a, etc. The
   -- recursive table my_t is perfectly legal, and it's possible to
   -- make a deep_copy function that can handle this by tracking
   -- which tables it has already started to copy.
   --
   -- Thanks to @mnemnion for pointing out that we should not call
   -- setmetatable() until we're doing copying values; otherwise we
   -- may accidentally trigger a custom __index() or __newindex()!
   --copy1和copy2都会发生这种情况，它们都试图
   
   --my\u t.a的副本，包括制作my\u t.a.a的副本，
   
   --其中包括制作一份my\t.a.a.a等的副本
   
   --递归表my\t是完全合法的，并且可以
   
   --制作一个deep\u copy函数，可以通过跟踪来处理此问题
   
   --已开始复制哪些表。
   
   --
   
   --感谢@mnemnion指出我们不应该打电话
   
   --setmetatable（），直到我们复制值为止；否则我们
   
   --可能会意外触发自定义\uu index（）或\uu newindex（）！
   
   function copy3(obj, seen)
       -- Handle non-tables and previously-seen tables.
       if type(obj) ~= 'table' then return obj end
       if seen and seen[obj] then return seen[obj] end
     
       -- New table; mark it as seen and copy recursively.
       local s = seen or {}
       local res = {}
       s[obj] = res
       for k, v in pairs(obj) do res[copy3(k, s)] = copy3(v, s) end
       return setmetatable(res, getmetatable(obj))
   end