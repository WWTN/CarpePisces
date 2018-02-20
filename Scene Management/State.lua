State = {}
State.__index = State

function State.Create(title, level)
    local self = {}
    setmetatable(self, State)
    -- Creates an instance of the variables to local
    self.Title = title
    self.Level = level
    return self
end

function State:Load()
    self.Level:Load()
end

function State:Unload()
    self.Level:Unload()
end

function State:Update(dt)
    self.Level:Update(dt)
end

function State:Draw()
    self.Level:Draw()
    love.graphics.print("State ".. tostring(self.Title))
end