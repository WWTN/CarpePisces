--
-- buddies 
--
-- Copyright (c) 2015 Sheepolution
--
-- This library is free software; you can redistribute it and/or modify it
-- under the terms of the MIT license. See LICENSE for details.

local buddies = {}
local func = {}

function buddies:__index(f)
	if type(f) == "string" then
		if f:sub(f:len(),f:len()) == "_" then
			local k = f:sub(0,f:len()-1)
			self[f] = function (self,...)
				for i=1,#self do
					if self[i][k] then
						self[i][k](self[i],...)
					end
				end
			end
		else
			self[f] = function (self,...)
				for i=#self,1,-1 do
					if self[i][f] then
						self[i][f](self[i],...)
					end
				end
			end
		end
		return self[f]
	end
end


function buddies.new(...)
	local t =  setmetatable({
		add = func.add,
		remove = func.remove,
		removeIf = func.removeIf,
		call = func.call,
		call_ = func.call_,
		others = func.others,
		others_ = func.others_,
		flush = func.flush,
		set = func.set,
		sort = func.sort
		}, buddies)
	t:add(...)
	return t
end


function func:add(...)
	for i, v in ipairs({...}) do
		table.insert(self, v)
	end
end


--Removes the object. If a number is passed, the object on that position will be removed instead.
function func:remove(obj)
	t = type(obj)
	
	local kill = 0
	
	if t == "table" then	
		for i=1,#self do
			if self[i] == obj then
				kill = i
				break
			end
		end
	elseif t == "number" then
		kill = obj
	end

	if kill > 0 then
		if #self == 1 then
			self[1] = nil
		else
			for i=kill + 1,#self do
				self[i-1] = self[i]
			end

			self[#self] = nil
		end
	end
end

function func:removeIf(func)
	for i=#self,1,-1 do
		if func(self[i]) then
			self:remove(self[i])
		end
	end
end


function func:count(func)
	local a
	for i=1,#self do
		if func(self[i]) then
			a = a + 1
		end
	end
	return a
end


--Calls the passed function for each object, passing the object as first argument.
function func:call(func)
	for i=#self,1,-1 do
		func(self[i])
	end
end

function func:call_(func)
	for i=1,#self do
		func(self[i])
	end
end

--Has all the objects iterate through the other objects, allowing for interactivity.
--Calls the passed function, giving both objects as arguments.
function func:others(func)
	for i=#self,2,-1 do
		for j=i-1,1,-1 do
			if func(self[i],self[j]) then break end
		end
	end
end

function func:others_(func)
	for i=1,#self-1 do
		for j=i+1,#self do
			if func(self[i],self[j]) then break end
		end
	end
end

--Sets a value to all the objects.
--Will only set the value if the object already has the property, unless force is true.
function func:set(k,v,force)
	for i=1,#self do
		if self[i][k]~=nil or force then
			self[i][k] = v
		end
	end
end

--Removes all the objects, but keeps the functions.
function func:flush()
	for i=1,#self do
		self[i] = nil
	end
end

--Sorts all the objects on a property.
--If an object does not have the passed property, it will be treated as 0.
--Will automatically sort from low to high, unlesss htl (high to low) is true.
function func:sort(k,htl)
	local sorted = false
	if htl then
		while not sorted do
			sorted = true
			for i=1,#self-1 do
				for j=i+1,#self do
					local propA, propB
					propA = self[i][k] or 0
					propB = self[j][k] or 0
					if propA < propB then
						local old = self[j]
						self[j] = self[i]
						self[i] = old
						sorted = false
					end
				end
			end
		end
	else
		while not sorted do
			sorted = true
			for i=1,#self-1 do
				for j=i+1,#self do
					local propA, propB
					propA = self[i][k] or 0
					propB = self[j][k] or 0
					if propA > propB then
						local old = self[j]
						self[j] = self[i]
						self[i] = old
						sorted = false
					end
				end
			end
		end
	end
end

return buddies