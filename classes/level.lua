-- dig it here for some old-school 1970s pong original game level design

local Level = Classic:extend()

function Level:new()
  self.objects = {}

  local wallWidth = 10
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  self:addWall(0, 0, windowWidth, wallWidth)
  self:addWall(0, windowHeight - wallWidth, windowWidth, wallWidth)
  --self:addWall(0, 0, wallWidth, windowHeight)
  --self:addWall(windowWidth - wallWidth, 0, wallWidth, windowHeight)

  self:addTrigger(0, 0 + wallWidth, wallWidth, windowHeight - 2*wallWidth, function() Event.dispatch('hit', 'left') end)
  self:addTrigger(windowWidth - wallWidth, 0 + wallWidth, wallWidth, windowHeight - 2*wallWidth, function() Event.dispatch('hit', 'right')end)

  drawer:add(self, "objects")
end

function Level:addWall(x, y, w, h)
  local wall = Wall(x, y, w, h)
  table.insert(self.objects, wall)
end

function Level:addTrigger(x, y, w, h, callback)
  local trigger = Trigger(x, y, w, h, callback)
  table.insert(self.objects, trigger)
end

function Level:draw()
  for _, wall in ipairs(self.objects) do
    wall:draw()
  end
end


return Level
