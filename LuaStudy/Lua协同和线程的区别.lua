-- 协程就是协程，不是线程。

-- CPU执行单位是线程，不是什么协程。

-- 协程，是同步执行，不是并行，只是切了一个上下文了，为你保存原来的上下文而已。

-- 切到第二个协程时，原来的协程处于挂起状态。

-- 这个特指lua的协程。

-- 协同程序跟线程差不多，就是一个执行序列，拥有自己独立的栈，局部变量和指针
-- 同时又与其它协同程序共享全局变量和其它大部分东西。跟线程的区别在于：
-- 一个具有多个线程的程序可以同时运行几个线程，而协同程序却需要彼此协作地运行；
-- 一个具有多个协同程序的程序在任意时刻只能运行一个协同程序，并且正在运行的协同程序只会在其显式地要求挂起时，它的执行才会暂停。


-- lua协程例子：

local function run(data)
print("co-body", 1, data.a)
print("co-body", 2, data.a)
print("co-body", 3, data.a)
coroutine.yield()
print("co-body", 4, data.a)
print("co-body", 5, data.a)
coroutine.yield()
end

local co = coroutine.create(run)

local data = {a=1}
coroutine.resume(co, data)

for i=1,5 do
print("main", i)
end
coroutine.resume(co, data)

-- coroutine.create() --	创建coroutine
-- coroutine.resume()	--暂停/开始coroutine
-- coroutine.yield()	--挂起coroutine
-- coroutine.status() --	coroutine的状态有三种：dead，suspend，running，
-- coroutine.wrap（）	--创建coroutine，返回一个函数，一旦你调用这个函数，就进入coroutine，和create功能重复
-- coroutine.running()	--返回正在跑的coroutine，一个coroutine就是一个线程，当使用running的时候，就是返回一个corouting的线程号

--运行结果：


-- co-body 1 1

-- co-body 2 1

-- co-body 3 1

-- main 1

-- main 2

-- main 3

-- main 4

-- main 5

-- co-body 4 1

-- co-body 5 1

 