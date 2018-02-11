
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

function SceneButtonsUpdate()

end

function SceneButtonsDraw()
    for i = 0, 2 do
        love.graphics.draw(sb.buttonImg, sb.actionBtnX + (5 + sb.btnWidth) * i, sb.actionBtnY, 0, 0.65, 0.65)
    end
    
    for i = 0, 3 do
        love.graphics.draw(sb.buttonImg, sb.navigationBtnX + (10 + sb.btnWidth) * i, sb.navigationBtnY, 0, 0.65, 0.65)
    end

    for i = 0, 1 do
        love.graphics.draw(sb.buttonImg, sb.menuBtnX, sb.menuBtnY + (60 + sb.btnHeight) * i, 0, 0.85, 0.85)
    end
    
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
