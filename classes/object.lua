local Object = Classic:extend()

function Object:new(x, y, w, h)
  world:add(self, x, y, w, h)
  self.width = w
  self.height = h
  self:setPosition(x, y)
end

function Object:setPosition(x, y)
  self.x = x
  if y ~= nil then
    self.y = y
  end
  world:update(self, self.x, self.y)
end

return Object
