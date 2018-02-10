require "Shop Menu"
require "Scene Management/Scene"

function love.load()
    currency = '¬'
    PlayerLoad()
    SceneLoad()
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
   SceneUpdate()
end

function love.draw()
    love.graphics.setBackgroundColor(128,128,208,255)

    if sb.shopOpen == true then
        ShopDraw()
    else
        SceneDraw()
    end
    PlayerDraw()
end

