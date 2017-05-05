updater = require "classes/updater"
drawer = require "classes/drawer"

Classic = require "libs/classic"
Bump = require "libs/bump"
Object = require "classes/object"
Player = require "classes/player"
Ball = require "classes/ball"
Wall = require "classes/wall"


function love.load()
  drawer:load()

-- level is coming
  world = Bump.newWorld()
  local player1 = Player(100, 200)
  local player2 = Player(700, 200)
  local ball = Ball(300, 100)
  local walls = {}
  walls.top = Wall(0, 0, 800, 10)
  walls.bottom = Wall(0, 590, 800, 10)
  walls.left = Wall(0, 0, 10, 600)
  walls.right = Wall(790, 0, 10, 600)

  player1.keys.up = "w"
  player1.keys.down = "s"
  player2.keys.up = "up"
  player2.keys.down = "down"
  ball:go()
end

function love.draw()
  -- draw everything...
  drawer:draw()
end

function love.update(dt)
  -- update everything...
  updater:update(dt)
end
