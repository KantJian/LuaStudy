function IteratorDIY(t1)
    function iteratorTableValue(t)
        local i=0
        return function () 
            i=i+1; return t[i] end
    end
    for i in iteratorTableValue(t1) do
    print(i)
    end
end
IteratorDIY({0,1,2,3,4,5,6,});
