require("Interface/Collision")

Shop = {}
Shop.__index = Shop

function Shop.Create()
    local self = {}
    setmetatable(self, Shop)
    self.Objects = {}

    return self
end

function Shop:Load()
    self.sellButton = love.graphics.newImage("ShopInterface/Buttons/Sell Button.png")
    self.sellButtonH = love.graphics.newImage("ShopInterface/Buttons/Sell Button Highlight.png")
    self.purchaseButton = love.graphics.newImage("ShopInterface/Buttons/PurchaseButton.png")
    self.purchaseButtonH = love.graphics.newImage("ShopInterface/Buttons/Purchase Button Highlight.png")
    self.exitButton = love.graphics.newImage("ShopInterface/Buttons/Exit Button.png")
    self.exitButtonH = love.graphics.newImage("ShopInterface/Buttons/Exit Button Highlight.png")
    
    self.sellHighlight = false
    self.purchaseHighlight = false
    self.exitHighlight = false

    self.sellButtonX = 30
    self.SellButtonY = 475

    self.purchaseButtonX = 200
    self.purchaseButtonY = 475

    self.exitButtonX = 30
    self.exitButtonY = 560
end

function Shop:Unload()

end

function Shop:Update()

end

function Shop:Draw()
    love.graphics.print("This is the shop", 50, 50)
    love.graphics.draw(self.sellButton, self.sellButtonX, self.SellButtonY, 0, 0.5, 0.5)

    love.graphics.draw(self.purchaseButton, self.purchaseButtonX, self.purchaseButtonY, 0, 0.5, 0.5)

end

function Shop:mousepressed(x, y, button)
    
end