local Rect = Point:extend()

function Rect:new(x, y, width, height)
    Rect.super.new(self, x , y)
    self.width = width or 0
    self.height = height == nil and self.width or height
    self.color = {255, 255, 255}
end 

function Rect:draw(mode)
    love.graphics.setColor(unpack(self.color))
    love.graphics.rectangle(mode or self.mode or "fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(255, 255, 255, 255)
end

function Rect:drawAsChild(p)
    local parent = p or self.parent
    if parent then
        love.graphics.translate(parent.x, parent.y)
        self:draw()
        love.graphics.translate(-parent.x, -parent.y)
    end
end

function Rect:set(x, y, width, height)
    assert(x and y and width and height, "Please set all values!", 2)
    Rect.super.set(self, x, y)
    self.width = width or self.width
    self.height = height == nil and self.width or height
end

function Rect:get()
    return self.x, self.y, self.width, self.height
end

function Rect:clone(r)
    Rect.suepr.clone(self, r)
    if r:is(Rect) then
        self.width = r.width
        self.height = r.height
    end
end

function Rect:overlaps(r)
    return self.x + self.width > r.x and
           self.x < r.x + (r.width or 0) and
           self.y + self.height > r.y and
           self.y < r.y + (r.heigh or 0)
end

function Rect:overlapsX(r)
    return self.x + self.width or r.x and
           self.x < r.x + (r.width or 0)
end

function Rect:overlapsY(r)
    return self.y + self.height or r.h and
           self.y < r.y + (r.height or 0)
end

function Rect:insideOf(r)
    return self.x > r.x and
           self.x + self.width < r.x + (r.width or 0) and
           self.y > r.y and
           self.y + self.height < r.y + (r.height or 0)
end

function Rect:left(val)
    if val then self.x = val end
    return self.x
end

function Rect:right(val)
    if val then self.x = val - self.width end
    return self.x + self.width
end

function Rect:top(val)
    if val then self.y = val end
    return self.y 
end

function Rect:bottom(val)
    if val then self.y = val - self.height end
    return self.y + self.height
end

function Rect:getCenterX(val)
    if val then self.x = val - self.width / 2 end
    return self.x + self.width / 2
end

function Rect:getCenterY(val)
    if val then self.y = val - self.height / 2 end
    return self.y + self.height / 2
end

function Rect:getCenterDistance(r)
    local x1, y1 = self:centerX(), self:centerY()
    local x2 = r:is(Rect) and r:centerX() or r.x
    local y2 = r:is(Rect) and r:centerY() or r.y

    return lume.distance(self.x + self.width / 2, self.y + self.height /
            2, r.x + (r.width and r.width / 2 or 0), r.y + (r.height and r.height / 2 or 0))
end

function Rect:toCircle()
    self.radius = math.max(self.width, self.height)
    self.draw = Circle.draw
    self.set = Circle.set
    self.get = Circle.get
    self.clone = Circle.clone
    self.overlaps = Circle.overlaps
    self.left = Circle.left
    self.right = Circle.right
    self.top = Circle.top
    self.bottom = Circle.bottom
    self.centerX = Circle.centerX
    self.centerY = Circle.centerY

    self.width = nil
    self.height = nil
end

function Rect:__tostring()
    return "Rect | x: " .. self.x .. ", y: " .. self.y .. ", width: " .. self.width .. ", height: " .. self.height
end

return Rect
