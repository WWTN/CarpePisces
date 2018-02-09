require "Shop Menu"

function love.load()
    currency = '¬'
    PlayerLoad()
    ShopLoad()
end

function love.keyreleased(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.update()
   ShopUpdate()
   PlayerUpdate()
end

function love.draw()
    PlayerDraw()
    ShopDraw()
end

