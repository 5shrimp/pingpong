local Player = Object:extend()

PlayerInputScheme = {
  wasd = {
    up = "w",
    down = "s"
  },
  arrows = {
    up = "up",
    down = "down"
  }
 }

function Player:new(x, y, scheme)
    Player.super.new(self, x, y, 20, 200)
    self.speed = 500

    if scheme == nil then
      self.keys = PlayerInputScheme.arrows
    else
      self.keys = scheme
    end

end

function Player:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:update(dt)
  Player.super.update(self, dt)
  -- check for keyboard and set state
  if love.keyboard.isDown(self.keys.up) then
    self.direction.y = -1
  elseif love.keyboard.isDown(self.keys.down) then
    self.direction.y = 1
  else
    self.direction.y = 0
  end
end

return Player
