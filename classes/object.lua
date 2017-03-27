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

function Object:move(goalX, goalY)
  local actualX, actualY, collisions, collisionsCount = world:move(self, goalX, goalY, self.filter)
  self.x = actualX
  self.y = actualY
  if collisionsCount > 0 then
    self.direction.x = self.direction.x - 2 * ( self.direction.x  * collisions[1].normal.x + self.direction.y  * collisions[1].normal.y) *  collisions[1].normal.x
    self.direction.y = self.direction.y - 2 * (self.direction.x  * collisions[1].normal.x + self.direction.y  * collisions[1].normal.y ) *  collisions[1].normal.y
    --print("AFTER: self.direction.x = " .. self.direction.x .. ", self.direction.y = " .. self.direction.y )
    self.speed = self.speed + 20
  end
  return actualX, actualY, collisions, collisionsCount
end

function Object:filter(item, other)
  return 'bounce'
end

return Object
