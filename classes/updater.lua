local updater = {
  objects = {}
}

function updater:add(object)
  table.insert(self.objects, object)
end

function updater:remove(object)
  for index, value in ipairs(self.objects) do
    if value == object then
      table.remove(self.objects, index)
    end
  end
end

function updater:update(dt)
  for _, value in ipairs(self.objects) do
    value:update(dt)
  end
end

return updater
