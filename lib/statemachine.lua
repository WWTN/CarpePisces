local class = require "lib.class"

local sm = class:derive("statemachine")

local transition = {
    enter = "__enter",
    none = "",
    exit = "__exit"
}

function sm:new(state)
    self.reset()
    self:change(state)
end

function sm:reset()
    self.state = nil
    self.prev = nil
    self.transition = transition.none
end

-- changes to a state without calling previous state_exit function
function sm:change_immediate(state)
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

