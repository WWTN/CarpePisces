
function MainSceneLoad()
    mainScene = {}

    mainScene.hallwayScene = love.graphics.newImage("Scene Management/Images/Background/hallway_background.jpg")
    mainScene.scene = mainScene.hallwayScene

    mainScene.x = 0
    mainScene.y = 0
    mainScene.width = 400
    mainScene.height = 400
end

function MainSceneUpdate()

end

function MainSceneDraw()
    love.graphics.setColor(200,200,200,255)
    love.graphics.draw(mainScene.hallwayScene, mainScene.x, mainScene.y, 0, 1, 0.9)
end