Test = {}
Test.__index = Test

function Test.Create()
    local self = {}
    setmetatable(self, Test)
    return self

end

function Test:Load()

end

function Test:Unload()

end

function Test:Update(dt)

end

function Test:Draw()
    love.graphics.print("This is test", 50, 50)
end