mytable = {"apple", "orange", "banana"}

print(collectgarbage("count"))

mytable = nil


print(collectgarbage("count"))

-- print(collectgarbage("collect"))

print(collectgarbage("restart"))

print(collectgarbage("count"))
-- collectgarbage("collect"): 执⾏垃圾回收的⼀个完整周期。
--     collectgarbage("count"): 返回当前使⽤的千字节的程序内存量
--     collectgarbage("restart"): 如果垃圾收集器已经停⽌，将重新启动它。
--     collectgarbage("setpause"): 设置给定为第⼆参数除以100⾄垃圾收集器暂停变量的值。它的⽤途是作为讨论的⼀点上
-- ⾯。
--     collectgarbage("setstepmul"): 设置给定为第⼆参数除以100到垃圾步骤乘数的变量的值。它的⽤途是作为讨论的⼀点
-- 上⾯。
--     collectgarbage("step"): 运⾏垃圾回收的⼀步。第⼆个参数是越⼤step也会变⼤。在收集的垃圾将返回true，如果触发
-- 的步骤是⼀个垃圾收集周期的最后⼀步。
--     collectgarbage("stop"): 停⽌垃圾收集器，如果它的运⾏。
-- -- --------------------------------------------------------
-- 1. 针对会产生泄露的函数,先调用collectgarbage(“count”),取得最初的内存使用
-- 2. 函数调用后, collectgarbage(“collect”)进行收集, 并使用collectgarbage(“count”)再取得当前内存, 最后记录两次的使用差
-- 3. 从test1的收集可看到, collectgarbage(“collect”)被调用，并不保证一次成功, 所以, 大可以调用多次

-- 避免Lua应用中出现的内存使用过大行为:
-- 1. 防止代码出现泄露
-- 2. 其实，Lua中被分配的内存，并不会及时的自动回收, 所以, 为了避免内存过大, 应用的运行时，可以定期的（调用collectgarbage(“collect”)，又或者collectgarbage(“step”)）进行显式回收。
