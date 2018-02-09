require "Items List"
require "Player"

function ShopLoad()
    ItemLoad()
    
    shop = {}
    shop.sellButton = love.graphics.newImage("ShopInterface/Buttons/Sell Button.png")
    shop.sellButtonHighlight = love.graphics.newImage("ShopInterface/Buttons/Sell Button Highlight.png")
    shop.purchaseButton = love.graphics.newImage("ShopInterface/Buttons/PurchaseButton.png")
    shop.purchaseButtonHighlight = love.graphics.newImage("ShopInterface/Buttons/Purchase Button Highlight.png")

    shop.sellHighlight = false
    shop.purchaseHighlight = false

    shop.sellButtonX = 30 
    shop.sellButtonY = 475

    shop.purchaseButtonX, shop.purchaseButtonY = 200, 475
    shop.buttonHeight = 105
    shop.buttonWidth = 300

end

function love.mousereleased(x, y, button)
    if button == 1 then
        if purchaseHighlight == true then 
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
    end
end

function ShopUpdate()
    ButtonHighlighting()
    ItemUpdate()

end

function ButtonHighlighting()
    sellButtonMouseCollision = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, shop.sellButtonX, shop.sellButtonY, shop.buttonWidth/2, shop.buttonHeight/2)
    if  sellButtonMouseCollision == true then
        sellHighlight = true
    else
        sellHighlight = false
    end

    purchaseButtonMouseCollision = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, shop.purchaseButtonX, shop.purchaseButtonY, shop.buttonWidth/2, shop.buttonHeight/2)
    if  purchaseButtonMouseCollision == true then
        purchaseHighlight = true
    else
        purchaseHighlight = false
    end

end

function ShopDraw()
    if sellHighlight == true then
        love.graphics.draw(shop.sellButtonHighlight, shop.sellButtonX, shop.sellButtonY, 0, 0.5, 0.5)
    else
        love.graphics.draw(shop.sellButton, shop.sellButtonX, shop.sellButtonY, 0, 0.5, 0.5)
    end

    if purchaseHighlight == true then
        love.graphics.draw(shop.purchaseButtonHighlight, shop.purchaseButtonX, shop.purchaseButtonY, 0, 0.5, 0.5)
    else
        love.graphics.draw(shop.purchaseButton, shop.purchaseButtonX, shop.purchaseButtonY, 0, 0.5, 0.5)
    end

    ItemDraw()

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
