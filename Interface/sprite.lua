local Sprite = Rect:extend()

function Sprite:new(x, y, img, w, h)
    Sprite.super.new(self, x, y)
    self.origin = Point(0, 0)
    self.offset = Point(0, 0)
    self.scale = Point(1, 1)
    self.border = Point(0, 0)
    self.border.alpha = 0
    self.border.color = {255, 255, 255}
    self.border.auto = true
    self.alpha = 1
    self.color = {255, 255, 255}
    self.angle = 0
    self.rotate = 0
    self.flip = false
    self.visible = true
    self.blend = "alpha"
    self.mirror = false
    self.parent = nil

    self._frames = {}
    if img then self.setImage(img, w, h) end
end

function Sprite:update(dt)
    self.animation:update(dt)
    self.angle = self.angle + self.rotate * dt
end

function Sprite:draw()
    if not self.visible or self.alpha == 0 then return end

    if self.border.auto then
        self:drawBorder()
    end

    love.graphics.setColor(self.color[1], self.color[2], self.color[3], self.alpha * 255)
    love.graphics.setBlendMode(self.blend)
    self:drawImage()

    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(255, 255, 255, 255)
end

function Sprite:drawImage()
    if self._image then
    else
        Sprite.super.draw(self)
    end 
end

function Sprite:drawBorder() end

function Sprite:drawDebug() end
function Sprite:setImage() end
function Sprite:centerOrigin() end
function Sprite:centerOffset() end
function Sprite:setFilter(filter)
    self.image:setFilter(filter)
end

function Sprite:setBlend(blend)
    self.blend = blend
end

function Sprite:addShader(name)
    table.insert(self._shaders, Shaders:get(name))
end

function Sprite:setShader(name)
    self.shader = name
end

function Sprite:send(name, extern, value)
    self._shaders[name]:send(extern, value)
end

function Sprite:__string()
    return "Sprite"
end

return Sprite