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

    item.blankListImage = love.graphics.newImage("ShopInterface/Shop_Interface/ListOfItems.png")
    item.smallPotionHighlight = love.graphics.newImage("ShopInterface/Shop_Interface/HighlightedOptions/ListOfItemsSmallPotionHighlighted.png")
    item.mediumPotionHighlight = love.graphics.newImage("ShopInterface/Shop_Interface/HighlightedOptions/ListOfItemsMedPotion-Highlighted.png")
    item.largePotionHighlight = love.graphics.newImage("ShopInterface/Shop_Interface/HighlightedOptions/ListOfItemsLargePotion-Highlighted.png")
    item.medicalHerbsHighlight = love.graphics.newImage("ShopInterface/Shop_Interface/HighlightedOptions/ListOfItemsMedici-Highlighted.png")
    item.listImage = item.blankListImage

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

    item.smallPotionSelected = false
    item.mediumPotionSelected = false
    item.largePotionSelected = false
    item.medicalHerbsSelected = false

    item.smallPotionCost = 30
    item.mediumPotionCost = 70
    item.largePotionCost = 130
    item.medicalHerbsCost = 100
end

function ItemUpdate()
    ItemSelection()
    ItemHighlighting()
end

function ItemHighlighting()
    if item.smallPotionSelected == true then
        item.listImage = item.smallPotionHighlight
    elseif item.mediumPotionSelected == true then
        item.listImage = item.mediumPotionHighlight
    elseif item.largePotionSelected == true then
        item.listImage = item.largePotionHighlight
    elseif item.medicalHerbsSelected == true then
        item.listImage = item.medicalHerbsHighlight
    else
        item.listImage = item.blankListImage
    end
end

function ItemSelection()
    local mouseOverItem1 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY, item.itemWidth, item.itemHeight)
    local mouseOverItem2 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY + item.itemHeight, item.itemWidth, item.itemHeight)
    local mouseOverItem3 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY + item.itemHeight * 2, item.itemWidth, item.itemHeight)
    local mouseOverItem4 = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1, item.listMemberX, item.listMemberY + item.itemHeight * 3, item.itemWidth, item.itemHeight)
  
    if mouseOverItem1 == true then
        item.image = item.smallPotionImage
        item.descriptionImage = item.smallDescription
    
        if love.mouse.isDown(1) then
            item.smallPotionSelected = true
            item.mediumPotionSelected = false
            item.largePotionSelected = false
            item.medicalHerbsSelected = false
        end
    end

    if mouseOverItem2 == true then
        item.image = item.mediumPotionImage
        item.descriptionImage = item.mediumDescription
  
        if love.mouse.isDown(1) then

            item.smallPotionSelected = false
            item.mediumPotionSelected = true
            item.largePotionSelected = false
            item.medicalHerbsSelected = false
        end
    end
    
    if mouseOverItem3 == true then
        item.image = item.largePotionImage
        item.descriptionImage = item.largeDescription
  
        if love.mouse.isDown(1) then
            
            item.smallPotionSelected = false
            item.mediumPotionSelected = false
            item.largePotionSelected = true
            item.medicalHerbsSelected = false
        end
    end

    if mouseOverItem4 == true then
        item.image = item.medicalHerbsImage
        item.descriptionImage = item.medicalHerbsDescription
  
        if love.mouse.isDown(1) then
            item.smallPotionSelected = false
            item.mediumPotionSelected = false
            item.largePotionSelected = false
            item.medicalHerbsSelected = true
      end
   end

--[[
     if love.mouse.isDown(1) then
        if mouseOverItem1 == false and mouseOverItem2 == false and mouseOverItem3 == false and mouseOverItem4 == false then
            item.image = item.blankImage
            item.descriptionImage = item.blankDescriptionImage
            item.smallPotionSelected = false
            item.mediumPotionSelected = false
            item.largePotionSelected = false
            item.medicalHerbsSelected = false
        end
    end]]

    if mouseOverItem1 == false and mouseOverItem2 == false and mouseOverItem3 == false  and mouseOverItem4 == false then
        if item.smallPotionSelected == true then
            item.image = item.smallPotionImage
            item.descriptionImage = item.smallDescription
        elseif item.mediumPotionSelected == true then
            item.image = item.mediumPotionImage
            item.descriptionImage = item.mediumDescription
        elseif item.largePotionSelected == true then
            item.image = item.largePotionImage
            item.descriptionImage = item.largeDescription
        elseif item.medicalHerbsSelected == true then
            item.image = item.medicalHerbsImage
            item.descriptionImage = item.medicalHerbsDescription
        else
            item.image = item.blankImage
            item.descriptionImage = item.blankDescriptionImage
        end
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
