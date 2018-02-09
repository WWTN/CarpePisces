require "Shop Menu"
require "Items List"
require "Player"

function love.load()
    currency = '¬'
    PlayerLoad()
    ShopLoad()
end

function love.update()
   ShopUpdate()
   PlayerUpdate()
end

function love.draw()
    PlayerDraw()
    ShopDraw()
end

