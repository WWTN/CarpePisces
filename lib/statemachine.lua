local Class = require "lib.class"

local SM = Class:derive("statemachine")

local transition = {
    enter = "__enter",
    none = "",
    exit = "__exit"
}

function SM:new(state)
    self.reset()
    self:change(state)
end

function SM:reset()
    self.state = nil
    self.prev = nil
    self.transition = transition.none
end

-- changes to a state without calling previous state_exit function
function SM:change_immediate(state)
    assert(type(state) == "string" or type(state) == "nil", "parameter state must be of type string or nil")
    assert(state == nil or self[state] ~= nil, "Can't find state: " .. state .. "as a state function!")

    self.prev = self.state
    self.state = state
    if self.state ~= nil and self[self.state .. transition.enter] ~= nil then
        self.transition = transition.enter
    else
        self.transition = transition.none
    end
end

function SM:change(state)
    if state == prev then return end
        self:change_immediate(state)
    if prev ~= nil and self[prev .. transition.exit] ~= nil then
        self.transition = transition.exit
    end
end

function SM:update(dt)
    if self.transition == transition.exit then
        self[self.prev .. self.transition](self, dt)
        
        if self.state ~= nil and self[self.state .. transition.enter] ~= nil then
            self.transition = transition.enter
        else
            self.transition = transition.none
        end
    
    elseif self.transition == transition.enter then
        self[self.state .. self.transition](self, dt)
        self.transition = transition.none
    elseif self.state ~= nil then
        self[self.state](self, dt)
    end
end

function SM:draw() end

return SM
    

