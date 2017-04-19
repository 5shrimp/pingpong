local Object = Classic:extend()

function Object:new(x, y, w, h)
  world:add(self, x, y, w, h)
  self.width = w
  self.height = h
  self:setPosition(x, y)
  self.speed = 0
  self.direction = { x = 0, y = 0 }
end

function Object:setPosition(x, y)
  self.x = x
  if y ~= nil then
    self.y = y
  end
  world:update(self, self.x, self.y)
end

function Object:update(dt)
  if self.speed > 0 and (self.direction.y ~= 0 or self.direction.x ~=0) then
    self:move(dt)
  end
end

function Object:move(dt)
  local goalX = self.x + self.speed * self.direction.x * dt
  local goalY = self.y + self.speed * self.direction.y * dt
  local actualX, actualY, collisions = world:move(self, goalX, goalY, self.filter)
  self.x = actualX
  self.y = actualY
  return collisions
end

function Object:filter(item, other)
  return 'touch'
end

return Object
