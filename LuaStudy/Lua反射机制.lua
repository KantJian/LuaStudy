RoleData = {1,2,3
}

function RoleData:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self

	return o
end

function refelect(obj)
	someObj = obj:new()
	--handle someObj
end
print(someObj)
--someObj就是从某个object得到的新对象


