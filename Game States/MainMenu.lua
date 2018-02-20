MainMenu = {}
MainMenu.__index = MainMenu

function MainMenu.Create()
    local self = {}
    setmetatable(self, MainMenu)
    self.Objects = {}

    return self
end

function MainMenu:Load()
    love.graphics.clear()

end

function MainMenu:Unload()

end

function MainMenu:Update(dt)
    -- Change states when button is pressed
end

function MainMenu:Draw()
    love.graphics.print("This is Main Menu", 50, 50)
end