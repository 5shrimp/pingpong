local Ball = Object:extend()

function Ball:new(x, y)
  Ball.super.new(self, x, y, 20, 20)
  self.moving = false
  self.speed = 300
end

function Ball:update(dt)
  if self.moving == true then
    newX = self.x + self.speed * self.direction.x * dt
    newY = self.y + self.speed * self.direction.y * dt
    local actualX, actualY, collisions, collisionsCount = self:move(newX, newY)
    --print("newX = " .. newX .. ", newY = " .. newY)
  end
end

function Ball:draw()
  x = self.x
  y = self.y
  love.graphics.setColor(255, 165, 0, 255)
  love.graphics.circle("fill", x, y, self.width/2)
  --love.graphics.rectangle("fill", x, y, self.width, self.width)
end

function Ball:go()
  self.moving = true
  self.direction = { x = math.random(), y = math.random() }
end

return Ball
