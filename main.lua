updater = require "classes/updater"
drawer = require "classes/drawer"

Classic = require "libs/classic"
Bump = require "libs/bump"
Object = require "classes/object"
Player = require "classes/player"
Ball = require "classes/ball"
Wall = require "classes/wall"
Level = require "classes/level"
Game = require "classes/game"

function love.load()
  drawer:load()

  world = Bump.newWorld()

  local game = Game()
  local level = Level()

  local ball = Ball(300, 100)
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
