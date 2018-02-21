require "lib/libs"
local Point = Object:extend()

function Point:new(x, y)
    self.x = x or 0
    self.y = y == nil and self.x or y
end 

function Point:set(x, y)
    assert(x and y, "Please set all values!", 2)
    self.x = x or self.x
    self.y = y or self.y
end

function Point:clone(p)
    self.x = p.x
    self.y = p.y
end

function Point:overlaps(r)
    local x1, y1, x2, y2 = self.x, self.y, r.x, r.y1
    return x1 > x2 and
           x1 < x2 + r.width and
           y1 > y2 and
           y1 < y2 + r.height
end

function Point:get()
    return self.x, self.y
end

function Point:getX()
    return self.x
end

function Point:getY()
    return self.y 
end

function Point:getDistance(p)
    return lume.distance(self.x, self.y, p.x, p.y)
end

function Point:__tostring()
    return "Point | x: " .. (self.x or 0) .. ", y: " .. (self.y or 0)
end

return Point