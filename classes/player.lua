local Player = Object:extend()

movingState = { none = "none", up = "up", down = "down" }

function Player:new(x, y)
    Player.super:new(x, y)
    self.state = movingState.none
    self.speed = 500
    self.keys = { up = "up", down = "down" }
end

function Player:draw()
  x = self.x
  y = self.y
  --print("x = " .. x .. ", y = " .. y)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("fill", x, y, 20, 200)
end

function Player:update(dt)
  -- check for keyboard and set state
  if love.keyboard.isDown(self.keys.up) then
    self.state = movingState.up
  elseif love.keyboard.isDown(self.keys.down) then
    self.state = movingState.down
  else
    self.state = movingState.none
  end

  -- update from states and check for height = love.graphics.getHeight( )
  self:move(dt)
end

function Player:move(dt)
  print(self.state)
  if self.state == movingState.up then
    self.y = self.y - self.speed * dt
  elseif self.state == movingState.down then
    self.y = self.y + self.speed * dt
  end
end

return Player
