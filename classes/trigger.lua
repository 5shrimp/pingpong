local Trigger = Wall:extend()

function Trigger:new(x, y, w, h, callback)
    Trigger.super.new(self, x, y, w, h)
    self.callback = callback
end

function Trigger:update(dt)
  self.super.update(self, dt)
  local actualX, actualY, cols, len = world:check(self, self.x, self.y)

  if len > 0 then
    if self.callback ~= nil then
      self.callback()
    end
  end
end

function Trigger:draw()
  love.graphics.setColor(0, 75, 45, 64)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Trigger:description()
  return "Trigger"
end

return Trigger
