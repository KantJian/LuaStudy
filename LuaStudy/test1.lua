--test1.lua
function  Fac(n)
    if n<=1 then
        return n 
    end
    return n* Fac(n-1)
end
