love.graphics.setDefaultFilter("nearest", "nearest")
math.randomseed(os.time())

local interface = {}

Point = require "Interface/point"
Rect = require "Interface/rect"
Circle = require "Interface/circle"
Sprite = require "Interface/sprite"
Button = require "Interface/button"
Input = require "Interface/input"
Mouse = require "Interface/mouse"



Key = Input()

Cursors = {}
Cursors.hand = love.mouse.getSystemCursor("hand")

function interface.keypressed(key)
    Key:inputpressed(key)
end

function interface.keyreleased(key)
    Key:inputreleased(key)
end

function interface.mousepressed(x, y, button)
    Mouse:inputpressed(button)
end

function interface.mousereleased(x, y, button)
    Mouse:inputreleased(button)
end

return interface