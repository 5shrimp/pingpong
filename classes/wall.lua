local Wall = Object:extend()

function Wall:new(x, y, w, h)
    Wall.super.new(self, x, y, w, h)
end

function Wall:draw()
  x = self.x
  y = self.y
  love.graphics.setColor(198,115,189, 255)
  love.graphics.rectangle("fill", x, y, self.width, self.height)
end

return Wall
