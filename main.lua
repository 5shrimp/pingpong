Classic = require "libs/classic"
Bump = require "libs/bump"
Object = require "classes/object"
Player = require "classes/player"

world = Bump.newWorld()
local player1 = Player(100, 200)
local player2 = Player(700, 200)


function love.load()
  player1.keys.up = "w"
  player1.keys.down = "s"
  player2.keys.up = "up"
  player2.keys.down = "down"
end

function love.draw()
  -- draw everything...
  player1:draw()
  player2:draw()

end

function love.update(dt)
  -- update everything...
  player1:update(dt)
  player2:update(dt)
end
