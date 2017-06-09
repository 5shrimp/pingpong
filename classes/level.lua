-- dig it here for some old-school 1970s pong original game level design

local Level = Classic:extend()

function Level:new()
  self.walls = {}

  local wallWidth = 10
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  self:addWall(0, 0, windowWidth, wallWidth)
  self:addWall(0, windowHeight - wallWidth, windowWidth, wallWidth)
  self:addWall(0, 0, wallWidth, windowHeight)
  self:addWall(windowWidth - wallWidth, 0, wallWidth, windowHeight)

  drawer:add(self, "objects")
end

function Level:addWall(x, y, w, h)
  local wall = Wall(x, y, w, h)
  table.insert(self.walls, wall)
end

function Level:draw()
  for _, wall in ipairs(self.walls) do
    wall:draw()
  end
end


return Level
