local layerNames = {
  "background",
  "objects",
  "effects",
  "gui"
}

local drawer = {
  layers = {}
}

function drawer:load()
  for _, layerName in ipairs(layerNames) do
    self.layers[layerName] = {}
  end
end

function drawer:add(object, layerName)
  table.insert(self.layers[layerName], object)
end

function drawer:remove(object)
  for _, layer in ipairs(self.layers) do
    for index, value in ipairs(layer) do
      if value == object then
        table.remove(layer, index)
      end
    end
  end
end

function drawer:clear()
  for _, layer in ipairs(self.layers) do
    layer = {}
  end
end

function drawer:draw()
  for _, layerName in ipairs(layerNames) do
    local layer = self.layers[layerName]
    for index, value in ipairs(layer) do
      if value.draw then
        value:draw()
      else
        print("error: no draw method in object"..value)
      end
    end
  end
end

return drawer
