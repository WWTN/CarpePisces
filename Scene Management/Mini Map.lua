function MiniMapLoad()
    map = {}

    map.x = 800
    map.y = 0
    map.width = 200
    map.height = 200

    map.schoolHallway = love.graphics.newImage("Scene Management/Images/Buttons/Mini Map.png")
    map.mapImg = map.schoolHallway
end

function MiniMapDraw()
    love.graphics.setColor(230,230,230,250)
    love.graphics.draw(map.mapImg, map.x, map.y)
    love.graphics.setColor(255, 255, 255, 255)    
end