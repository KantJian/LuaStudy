girl = {money = 200}
function girl.goToMarket(girl ,someMoney)
    girl.money = girl.money - someMoney
end
girl.goToMarket(girl ,100)
print(girl.money)


boy = {money = 200}
function boy:goToMarket(someMoney)
    self.money = self.money - someMoney
end
boy:goToMarket(100)
print(boy.money)

-- 可以看出，冒号定义和冒号调用其实跟上面的效果一样，
-- 只是把第一个隐藏参数省略了，
-- 而该参数self指向调用者自身
-- 当然了，我们也可以点号定义冒号调用，或者冒号定义点号调用
boy = {money = 200}
function boy.goToMarket(self ,someMoney)
    self.money = self.money - someMoney
end
boy:goToMarket(100)
print(boy.money)
--总结:冒号只是起了省略第一个参数self的作用，
--该self指向调用者本身，并没有其他特殊的地方。
