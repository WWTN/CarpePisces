require "Player"
require "Scene Management/Mini Map"
require "Scene Management/Main Scene"
require "Scene Management/Scene Buttons"

function SceneLoad()
    love.graphics.setNewFont(15)
    MainSceneLoad()
    SceneButtonsLoad()
    MiniMapLoad()
    doorClicked = false
    
end

function SceneUpdate()
    MainSceneUpdate()
end

function SceneDraw()
    MainSceneDraw()
    SceneButtonsDraw()
    MiniMapDraw()
    
    -- Player UI
    player.healthX  = 835
    player.healthY = 200
    player.moneyPosX = 815
    player.moneyPosY = player.healthY + 45


    -- Black Borders on the main scene
    love.graphics.setColor(0,0,0,255)
    love.graphics.rectangle("fill", sb.actionBtnX + 17 + sb.btnWidth * 3, 540, 5, 100)
    love.graphics.rectangle("fill", 0, 540, 1000, 5)
    love.graphics.rectangle("fill", 800, 0, 5, 540)
    love.graphics.setColor(255,255,255,255)
end