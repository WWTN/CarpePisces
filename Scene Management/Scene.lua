require "Player"
require "Scene Management/Main Scene"
require "Scene Management/Scene Buttons"

function SceneLoad()
    MainSceneLoad()
    SceneButtonsLoad()
end

function SceneUpdate()
    MainSceneUpdate()
    SceneButtonsUpdate()
end

function SceneDraw()
    MainSceneDraw()
    SceneButtonsDraw()
end