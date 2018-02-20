--require "Shop Menu"
--require "Scene Management/Scene"
require("Scene Management/GameState")
require("Scene Management/State")

require("Game States/MainMenu")
require("Game States/GameOver")

function love.load()
    --[[currency = '¬'
    PlayerLoad()
    SceneLoad()
    ShopLoad()]]--

    states = GameState.Create(1)

    -- Main Menu (1)
    states:AddState(State.Create("Main Menu", MainMenu.Create()))

    -- Game Over (2)
    states:AddState(State.Create("Game Over", GameOver.Create()))

    -- Game (3)
    --states.AddState(State.Create("Game", Game.Create()))
end



function love.update()
    states:Update(dt)
 --[[ShopUpdate()
   PlayerUpdate()
   SceneUpdate()]]--
end

function love.draw()
    states:Draw()
    --love.graphics.setBackgroundColor(128,128,208,255)

    --[[if shopOpen == true then
        ShopDraw()
    else
        SceneDraw()
    end
    PlayerDraw()
    love.graphics.setBackgroundColor(52,46,58,16)]]--
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == "1" then
        states:ChangeState(1)
    end

    if key == "2" then
        states:ChangeState(2)
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
    end
    
    
    if button == 1 then
        shopButton = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, sb.menuBtnX, sb.menuBtnY + (60 + sb.btnHeight), sb.btnWidth, sb.btnHeight)
        if shopButton == true then
            shopOpen = true
        end
    end
end





