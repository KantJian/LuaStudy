--试试继承
    local smartMan = {
       name = "none",
     age = 25,
       money = 9000000,
      
        sayHello = function()
           print("大家好，我是聪明的豪。");
        end
     }
  
     local t1 = {};
     local t2 = {}
  
    local mt = {__index = smartMan}
  
    setmetatable(t1, mt);
     setmetatable(t2, mt);
  
    print(t1.money);
    t2.sayHello();
