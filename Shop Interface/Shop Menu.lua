require "Shop Interface/Items List"
require "Player"

function ShopLoad()
    ItemLoad()
    
    shop = {}
    shop.sellButton = love.graphics.newImage("Shop Interface/Buttons/Sell Button.png")
    shop.sellButtonHighlight = love.graphics.newImage("Shop Interface/Buttons/Sell Button Highlight.png")
    shop.purchaseButton = love.graphics.newImage("Shop Interface/Buttons/PurchaseButton.png")
    shop.purchaseButtonHighlight = love.graphics.newImage("Shop Interface/Buttons/Purchase Button Highlight.png")
    shop.exitButton = love.graphics.newImage("Shop Interface/Buttons/Exit Button.png")
    shop.exitButtonHighlight = love.graphics.newImage("Shop Interface/Buttons/Exit Button Highlight.png")

    shop.sellHighlight = false
    shop.purchaseHighlight = false
    shop.exitHighlight = false

    shop.exitButtonX = 30
    shop.exitButtonY = 560

    shop.sellButtonX = 30 
    shop.sellButtonY = 475

    shop.purchaseButtonX = 200
    shop.purchaseButtonY = 475

    shop.buttonHeight = 105 * 0.5
    shop.buttonWidth = 300 * 0.5
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
    -- Player UI
    player.healthX = 450
    player.healthY = 10
    player.moneyPosX = 30
    player.moneyPosY = 10 

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
