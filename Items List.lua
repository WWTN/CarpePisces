function ItemLoad()
    item = {}
    
    item.blankDescriptionImage = love.graphics.newImage("ShopInterface/Shop_Interface/ItemDescription.png")
    item.smallDescription = love.graphics.newImage("ShopInterface/Shop_Interface/ItemDiscrSmall.png")
    item.mediumDescription = love.graphics.newImage("ShopInterface/Shop_Interface/ItemDiscrMed.png")
    item.largeDescription = love.graphics.newImage("ShopInterface/Shop_Interface/ItemDiscrLarge.png")
    item.medicalHerbsDescription = love.graphics.newImage("ShopInterface/Shop_Interface/ItemDiscrMedicinalH.png")
    item.descriptionImage = item.blankDescriptionImage

    item.descriptionX = 30
    item.descriptionY = 280

    item.listImage = love.graphics.newImage("ShopInterface/Shop_Interface/ListOfItems.png")
    
    item.blankImage = love.graphics.newImage("ShopInterface/Shop_Interface/ItemPicture.png")
    item.smallPotionImage = love.graphics.newImage("ShopInterface/Shop_Interface/SmallPotionPicture.png")
    item.mediumPotionImage = love.graphics.newImage("ShopInterface/Shop_Interface/MediumPotionPicture.png")
    item.largePotionImage = love.graphics.newImage("ShopInterface/Shop_Interface/LargePotionPicture.png")
    item.medicalHerbsImage = love.graphics.newImage("ShopInterface/Shop_Interface/MedicinalHerbsPicture.png")
    item.image = item.blankImage

    item.listX = 450
    item.listY = 30
    item.listMemberX = item.listX + 4 
    item.listMemberY = item.listY + 66 
    item.itemHeight = 34
    item.itemWidth = 374

    item.smallPotionCost = 30
    item.mediumPotionCost = 70
    item.largePotionCost = 130
    item.medicalHerbCost = 100

    item.imageClickShow = false
end

function ItemUpdate()
    local mouseOverItem1 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY, item.itemWidth, item.itemHeight)
    local mouseOverItem2 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY + item.itemHeight, item.itemWidth, item.itemHeight)
    local mouseOverItem3 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY + item.itemHeight * 2, item.itemWidth, item.itemHeight)
    local mouseOverItem4 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY + item.itemHeight * 3, item.itemWidth, item.itemHeight)
  
    if mouseOverItem1 == true then
        item.image = item.smallPotionImage
        item.descriptionImage = item.smallDescription
    
        if love.mouse.isDown(1) then
            item.imageClickShow = true
        end
      end

    if mouseOverItem2 == true then
        item.image = item.mediumPotionImage
        item.descriptionImage = item.mediumDescription
  
        if love.mouse.isDown(1) then
            item.imageClickShow = true
        end
        end
    
    if mouseOverItem3 == true then
        item.image = item.largePotionImage
        item.descriptionImage = item.largeDescription
  
        if love.mouse.isDown(1) then
            item.imageClickShow = true
        end
        end

    if mouseOverItem4 == true then
        item.image = item.medicalHerbsImage
        item.descriptionImage = item.medicalHerbsDescription
  
        if love.mouse.isDown(1) then
            item.imageClickShow = true
        end
    end

    if item.imageClickShow == false and mouseOverItem1 == false and mouseOverItem2 == false and mouseOverItem3 == false  and mouseOverItem4 == false then
        item.image = item.blankImage
        item.descriptionImage = item.blankDescriptionImage
    end
end

function ItemDraw()
    love.graphics.draw(item.image, 30, 30)
    love.graphics.draw(item.descriptionImage, item.descriptionX, item.descriptionY)
    love.graphics.draw(item.listImage, item.listX, item.listY)
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
