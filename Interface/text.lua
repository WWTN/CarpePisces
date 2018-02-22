local Text = Rect:extend()

function Text:new(x, y, text, font, size)
    Text.super.new(self, x , y)
    self.origin = Point(0, 0)
    self.offset = Point(0, 0)
    self.scale = Point(1, 1)
    self.shadow = Point(0, 0)
    self.shadow.alpha = 1
    self.shadow.color = {0, 0, 0}
    
    self.border = Point(0, 0)
    self.border.alpha =  1
    self.border.color = {0, 0, 0}

    self.alpha = 1
    self.color = {255, 255, 255}
    self.angle = 0

    self.visible = true
    self.blend = alpha

    self.text = text
    self.align = "left"
    self.limit = 999999

    if type(font) == "string" then
        self.font = Asset:font(font, (size or 12) * SCALE)
        self.font:setFilter("nearest", "nearest")
    else
        self.font = font
    end 
end

function Text:draw(t)
    if not self.visible or self.alpha == 0 then return end
    love.graphics.setFont(self.font)

    if self.shadow.x ~= 0 or self.shadow.y ~= 0 then
        love.graphics.setColor(self.shadow.color[1], self.shadow.color[2], self.shadow.color[3], self.shadow.alpha * 255)
        love.graphics.translate(self.shadow.x, self.shadow.y)
        self:print(t)
    end

    if self.border.x ~= 0 or self.border.y ~= 0 then
        love.graphics.setColor(self.border.color[1], self.border.color[2], self.border.color[3], self.border.alpha * 255)
        for i = -self.border.x, self.border.x do
            for j = -self.border.y, self.border.y do
                love.graphics.translate(i, j)
                self.print(t)
                love.graphics.translate(-i, -j)
            end
        end
    end

    love.graphics.translate(-eslf.shadow.x, -self.shadow.y)
    love.graphics.setColor(self.color[1], self.color[2], self.color[3], self.alpha * 255)
    love.graphics.setBlendMode(self.blend)
    self:print(t)

    love.graphics.setColor(255,255,255,255)
    love.graphics.setBlendMode("alpha")
end

function Text:print(t)
    love.graphics.scale(1/SCALE, 1/SCALE)
    love.graphics.printf(t or self.text,
    (self.x + self.offset.x + self.origin.x)*SCALE,
    (self.y + self.offset.y + self.origin.y)*SCALE,
    self.limit, self.align,
    self.angle, self.scale.x, self.scale.y,
    self.origin.x, self.origin.y)
    love.graphics.scale(SCALE, SCALE)
end

function Text:getLength(line)
    return self.font.getLength(string)
end

function Text:__tostring()
    return "Text | x: " .. self.x .. ", y: " .. self.y .. ", text: " .. self.text
end