local Blast = Classic:extend()

function Blast:new(x, y)
  self.particleSystem = love.graphics.newParticleSystem(love.graphics.newImage('assets/images/pixel.png'), 64)
  self.particleSystem:setParticleLifetime(1, 2)

  self.particleSystem:setPosition(x, y)

  drawer:add(self, "effects")
  updater:add(self)

  -- set sizes
  self.particleSystem:setLinearAcceleration(-50, -50, 50, 50)
  self.particleSystem:setColors(255, 255, 255, 255, 255, 255, 255, 0)
  self.particleSystem:setSizes(64, 32)
  self.particleSystem:emit(5)

  print("Blast:new")
end

function Blast:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(self.particleSystem)
  print("Blast:draw")
end

function Blast:update(dt)
  self.particleSystem:update(dt)
  print("Blast:update")
end


return Blast
