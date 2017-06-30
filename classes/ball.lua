local Ball = Object:extend()

function Ball:new(x, y)
  Ball.super.new(self, x, y, 20, 20)
  --self.speed = 300
end

function Ball:draw()
  love.graphics.setColor(255, 165, 0, 255)
  love.graphics.circle("fill", self.x + self.width/2, self.y + self.width/2, self.width/2)
end

function Ball:go()
  self.speed = 300
  self.direction = { x = 1, y = 1 }
  --self.direction = { x = math.random(), y = math.random() }
end

function Ball:reset()
  self.x = 300
  self.y = 100
  self.speed = 0
end

function Ball:move(dt)
  local collisions = Ball.super.move(self, dt)
  if #collisions > 0 then
    self.direction.x = self.direction.x - 2 * ( self.direction.x * collisions[1].normal.x + self.direction.y * collisions[1].normal.y) * collisions[1].normal.x
    self.direction.y = self.direction.y - 2 * (self.direction.x * collisions[1].normal.x + self.direction.y * collisions[1].normal.y ) * collisions[1].normal.y
    self.speed = self.speed + 20
  end
end

function Ball:filter(item, other)
  if item == nil then
    return 'bounce'
  end

  if item:is(Trigger) then
    return 'cross'
  else
    return 'bounce'
  end
end


function Ball:description()
  return "Ball"
end


return Ball
