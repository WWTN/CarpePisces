require "Items List"
require "Player"

function ShopLoad()
    ItemLoad()
    
    shop = {}
    shop.sellButton = love.graphics.newImage("ShopInterface/Buttons/Sell Button.png")
    shop.sellButtonHighlight = love.graphics.newImage("ShopInterface/Buttons/Sell Button Highlight.png")
    shop.purchaseButton = love.graphics.newImage("ShopInterface/Buttons/PurchaseButton.png")
    shop.purchaseButtonHighlight = love.graphics.newImage("ShopInterface/Buttons/Purchase Button Highlight.png")
    shop.exitButton = love.graphics.newImage("ShopInterface/Buttons/Exit Button.png")
    shop.exitButtonHighlight = love.graphics.newImage("ShopInterface/Buttons/Exit Button Highlight.png")

    shop.sellHighlight = false
    shop.purchaseHighlight = false
    shop.exitHighlight = false

    shop.exitButtonX = 30
    shop.exitButtonY = 560

    shop.sellButtonX = 30 
    shop.sellButtonY = 475

    shop.purchaseButtonX = 200
    shop.purchaseButtonY = 475

    shop.buttonHeight = 52.5
    shop.buttonWidth = 150
end

function love.mousereleased(x, y, button)
    if button == 1 then
        if shop.purchaseHighlight == true then 
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
            sb.shopOpen = false
        end
    end
end

function ShopUpdate()
    ButtonHighlighting()
    ItemUpdate()

end

function ButtonHighlighting()
    sellButtonMouseCollision = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, shop.sellButtonX, shop.sellButtonY, shop.buttonWidth, shop.buttonHeight)
    if  sellButtonMouseCollision == true then
        shop.sellHighlight = true
    else
        shop.sellHighlight = false
    end

    purchaseButtonMouseCollision = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, shop.purchaseButtonX, shop.purchaseButtonY, shop.buttonWidth, shop.buttonHeight)
    if  purchaseButtonMouseCollision == true then
        shop.purchaseHighlight = true
    else
        shop.purchaseHighlight = false
    end

    exitButtonMouseCollision = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, shop.exitButtonX, shop.exitButtonY, shop.buttonWidth, shop.buttonHeight)
    if  exitButtonMouseCollision == true then
        shop.exitHighlight = true
    else
        shop.exitHighlight = false
    end
end

function ShopDraw()
    if shop.sellHighlight == true then
        love.graphics.draw(shop.sellButtonHighlight, shop.sellButtonX, shop.sellButtonY, 0, 0.5, 0.5)
    else
        love.graphics.draw(shop.sellButton, shop.sellButtonX, shop.sellButtonY, 0, 0.5, 0.5)
    end

    if shop.purchaseHighlight == true then
        love.graphics.draw(shop.purchaseButtonHighlight, shop.purchaseButtonX, shop.purchaseButtonY, 0, 0.5, 0.5)
    else
        love.graphics.draw(shop.purchaseButton, shop.purchaseButtonX, shop.purchaseButtonY, 0, 0.5, 0.5)
    end

    if shop.exitHighlight == true then
        love.graphics.draw(shop.exitButtonHighlight, shop.exitButtonX, shop.exitButtonY, 0, 0.5, 0.5)
    else
        love.graphics.draw(shop.exitButton, shop.exitButtonX, shop.exitButtonY, 0, 0.5, 0.5)
    end        

    ItemDraw()

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
