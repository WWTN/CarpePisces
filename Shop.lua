function ShopLoad()
    shop = {}
    shop.sellButton = love.graphics.newImage("ShopInterface/SellButton.png")
    shop.sellButtonHighlight = love.graphics.newImage("ShopInterface/Sell Button Highlight.png")
    shop.purchaseButton = love.graphics.newImage("ShopInterface/Purchase Button.png")
    shop.purchaseButtonHighlight = love.graphics.newImage("ShopInterface/Purchase Button Highlight.png")

    shop.sellHighlight = false
    shop.purchaseHighlight = false

    shop.sellButtonX = 30 
    shop.sellButtonY = 80
    shop.purchaseButtonX, shop.purchaseButtonY = 30, 800

    shop.buttonHeight = 105
    shop.buttonWidth = 300


end

function ShopUpdate()
    clickCollision = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, shop.sellButtonX, shop.sellButtonY, shop.buttonWidth/2, shop.buttonHeight/2)
    if clickCollision == true then
        sellHighlight = true
    else
        sellHighlight = false
    end

end

function ShopDraw()
if sellHighlight == true then
    love.graphics.draw(shop.sellButtonHighlight, shop.sellButtonX, shop.sellButtonY, 0, 0.5, 0.5)
else
    love.graphics.draw(shop.sellButton, shop.sellButtonX, shop.sellButtonY, 0, 0.5, 0.5)
end

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
