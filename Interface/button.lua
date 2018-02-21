local Button = Sprite:extend()

Button.defaultShape = "rectangle"

function Button:new(x, y, shape)
    Button.super.new(self, x, y)
    self.radius = 0

    self.shape = shape or "rectangle"
    
    self.onRelease = false
    self.buttons = {"1"}

    self.inactive = false

    self.hovering = false
    self.hold = false
    self.activated = false
end 

function Button:update(dt)
    if not self.inactive then
        Button.super.update(self, dt)

        self.activated = false

        local a = self.hovering

        if self:hovers(Mouse) then
            if self.hoverFunc then self.hoverFunc(self) end
            if self:isPressed() then
                self.hold = true
                if not self.onRelease then
                    self.activated = true
                end
            end
        else
            if a then
                if self.offFunc then self.offFunc(self) end
            end
        end

        if self.onRelease then
            if self:isReleased() then
                if self.hovering and self.hold then
                    self.activated = true
                end
                self.hold = false
            end
        end

        if self.activated then
            if self.func then self.func(self) end
        end
    end
end

function Button:onPress(func)
    self.func = func
    return self
end

function Button:onHover(func)
    self.hoverFunc = func
    return self
end

function Button:offHover(func)
    self.offfunc = func
end

function Button:hovers(p)
    if self.shape == "rectangle" then
        self.hovering = self.overlaps(p)
    end

    if self.hovering then
        Mouse:setCursor(Cursors.hand)
    end

    return self.hovering
end

function Button:setImage(url, width, height, auto)
    Button.super.setImage(self, url, width, height)

    if self.shape == "circle" then
        self.centerOffset()
        self.radius = self.width
        self.width = nil
        self.height = nil
    end
end

function Button:isPressed()
    return Mouse:isPressed(unpack(self.buttons))
end

function Button:isReleased()
    return Mouse:isReleased(unpack(self.buttons))
end

function Button:__tostring()
    return "Button | hover: " .. self.hovering .. ", hold: " .. self.hold .. ", activated: " .. self.activated
end