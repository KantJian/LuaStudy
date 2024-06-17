--协同程序(协程)
--协程的创建
--常用方法
--通过coroutine.create()
fun = function()
	print(666)	
end

--创建协程会有一个返回值，声明一个变量去接收
co = coroutine.create(fun)
print(co)
print(type(co))--类型线程

--第二种方法
--coroutine.wrap()
co2= coroutine.wrap(fun)
print(co2)
print(type(co2))
--创建出来的不是线程类型而是函数

--协程运行
fun = function()
	print(666)	
end

co = coroutine.create(fun)
co2= coroutine.wrap(fun)
--这是协程运行的第一种方式，对应运行通过coroutine.create()创建出来的协程
coroutine.resume(co)

--第二种方式 对应通过coroutine.wrap()创建出来的协程
co2() --因为其本质就是函数，直接调就完事了
