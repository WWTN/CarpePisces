require "Shop Interface/Shop Menu"
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


function love.mousereleased(x, y, button)
    if button == 1 then
        if shop.purchaseHighlight == true and player.money ~= 0 then 
            if item.smallPotionSelected == true then
                player.currentHealth = player.currentHealth + 10
                player.money = player.money - item.smallPotionCost
            elseif item.mediumPotionSelected == true then
                player.currentHealth = player.currentHealth + 25
                player.money = player.money - item.mediumPotionCost
            elseif item.largePotionSelected == true then
                player.currentHealth = player.currentHealth + 50
                player.money = player.money - item.largePotionCost
            elseif item.medicalHerbsSelected == true then
                player.currentHealth = player.currentHealth + math.random(-200, 200)
                player.money = player.money - item.medicalHerbsCost
            end
        end

        if shop.exitHighlight == true then
            shopOpen = false
        end

        if x > 202 and x < 202 + 146 and y > 99 and y < 99 + 397 * 0.9 then
            doorClicked = true
        end

        if doorClicked == true then
            if text == "Enter" then
                mainScene.scene = mainScene.monsterHallwayScene
            end
        end
                
    end
    
    
    if button == 1 then
        shopButton = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, sb.menuBtnX, sb.menuBtnY + (60 + sb.btnHeight), sb.btnWidth, sb.btnHeight)
        if shopButton == true then
            shopOpen = true
        end
    end
end

function love.update()
   ShopUpdate()
   PlayerUpdate()
   SceneUpdate()
end

function love.draw()
    --love.graphics.setBackgroundColor(128,128,208,255)

    if shopOpen == true then
        ShopDraw()
    else
        SceneDraw()
    end
    PlayerDraw()
    love.graphics.setBackgroundColor(52,46,58,16)
end

