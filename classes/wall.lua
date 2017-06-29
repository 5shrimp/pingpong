local Wall = Object:extend()

function Wall:new(x, y, w, h)
    Wall.super.new(self, x, y, w, h)
end

function Wall:draw()
  love.graphics.setColor(0, 75, 45, 255)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Wall:description()
  return "Wall"
end

return Wall
