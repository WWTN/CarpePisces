GameOver = {}
GameOver.__index = GameOver

function GameOver.Create()
    local self = {}
    setmetatable(self, GameOver)
    return self
    
end

function GameOver:Load()
    love.graphics.clear()
end

function GameOver:Unload()

end

function GameOver:Update(dt)

end

function GameOver:Draw()
    love.graphics.print("This is Game Over", 50, 50)
end