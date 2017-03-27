Classic = require "libs/classic"
Bump = require "libs/bump"
Object = require "classes/object"
Player = require "classes/player"
Ball = require "classes/ball"
Wall = require "classes/wall"

world = Bump.newWorld()
local player1 = Player(100, 200)
local player2 = Player(700, 200)
local ball = Ball(300, 100)
local walls = {}
walls.top = Wall(0, 0, 800, 10)
walls.bottom = Wall(0, 590, 800, 10)
walls.left = Wall(0, 0, 10, 600)
walls.right = Wall(790, 0, 10, 600)

function love.load()
  player1.keys.up = "w"
  player1.keys.down = "s"
  player2.keys.up = "up"
  player2.keys.down = "down"
  ball:go()
end

function love.draw()
  -- draw everything...
  player1:draw()
  player2:draw()
  ball:draw()

  walls.bottom:draw()
  walls.top:draw()
  walls.left:draw()
  walls.right:draw()

end

function love.update(dt)
  -- update everything...
  player1:update(dt)
  player2:update(dt)
  ball:update(dt)
end
