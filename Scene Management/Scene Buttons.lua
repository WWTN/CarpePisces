function SceneButtonsLoad()
    sb = {}
    sb.buttonImg = love.graphics.newImage("Scene Management/Images/Buttons/Action Button.png")
    sb.actionBtnX = 3
    sb.actionBtnY = 560
    
    sb.navigationBtnX = 430.8
    sb.navigationBtnY = sb.actionBtnY

    sb.menuBtnX = 815
    sb.menuBtnY = 300

    sb.btnWidth = 204 * 0.65
    sb.btnHeight = 105 * 0.65

    shopOpen = false 
end
function

function SceneButtonsDraw()
    for i = 0, 2 do
        love.graphics.draw(sb.buttonImg, sb.actionBtnX + (5 + sb.btnWidth) * i, sb.actionBtnY, 0, 0.65, 0.65)
        
        text = "ACTION"
        if doorClicked == true then
            if i == 0 then
                text = "Enter"
            elseif i == 1 then
                text = "Close"
            elseif i == 2 then
                text = "Look At"
            end
        end

        love.graphics.setNewFont(25)
        love.graphics.setColor(0,0,0,255)
        love.graphics.print(text, sb.actionBtnX + (5 + sb.btnWidth) * i + sb.btnWidth*1/7, sb.actionBtnY + sb.btnHeight*1/3)
        love.graphics.setColor(255,255,255,255)
        love.graphics.setNewFont(15)
    end
    
    for i = 0, 3 do
        love.graphics.draw(sb.buttonImg, sb.navigationBtnX + (10 + sb.btnWidth) * i, sb.navigationBtnY, 0, 0.65, 0.65)
       
        if i == 0 then
            text = "NORTH"
        elseif i == 1 then
            text = "SOUTH"
        elseif i == 2 then
            text = "EAST"
        elseif i == 3 then
            text = "WEST"
        end
            
        love.graphics.setNewFont(25)
        love.graphics.setColor(0,0,0,255)
        love.graphics.print(text, sb.navigationBtnX + (10 + sb.btnWidth) * i + sb.btnWidth*1/7, sb.navigationBtnY + sb.btnHeight*1/3)
        love.graphics.setColor(255,255,255,255)
        love.graphics.setNewFont(15)
    end

    for i = 0, 1 do
        love.graphics.draw(sb.buttonImg, sb.menuBtnX, sb.menuBtnY + (60 + sb.btnHeight) * i, 0, 0.85, 0.85)
   
        if i == 0 then
            text = "INVENTORY"
        else
            text = "SHOP"
        end

        love.graphics.setNewFont(25)
        love.graphics.setColor(0,0,0,255)
        love.graphics.print(text, sb.menuBtnX + sb.btnWidth*1/7, sb.menuBtnY + (60 + sb.btnHeight) * i + sb.btnHeight*1/3)
        love.graphics.setColor(255,255,255,255)
        love.graphics.setNewFont(15)
    end
    

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
