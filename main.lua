updater = require "classes/updater"
drawer = require "classes/drawer"

lume = require "libs/lume"

Classic = require "libs/classic"
Bump = require "libs/bump"
Event = require "libs/event"

Object = require "classes/object"
Player = require "classes/player"
Ball = require "classes/ball"
Wall = require "classes/wall"
Level = require "classes/level"
Game = require "classes/game"
Trigger = require "classes/trigger"
Blast = require "classes/blast"


function love.load()
  drawer:load()

  world = Bump.newWorld()

  local game = Game()
  local level = Level()

end

function love.draw()
  -- draw everything...
  drawer:draw()
end

function love.update(dt)
  -- update everything...
  updater:update(dt)
end
