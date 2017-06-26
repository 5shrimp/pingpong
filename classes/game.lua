local Game = Classic:extend()

function Game:new()
  self.players = {
    {
      object = Player(100, 200, PlayerInputScheme.wasd),
      score = 0
    },
    {
      object = Player(700, 200, PlayerInputScheme.arrows),
      score = 0
    }
  }
end

function Game:addScore(player)
  for _, value in ipairs(self.players) do
    if value == player then
      value.score = value.score + 1
    end
  end
  self.printScore()
end

function Game:printScore()
  print("player1:"..self.players[1].score..", player2:"..self.players[2].score)
end

function Game:isOver()
  --
end

function Game:reset()
  --
end

return Game
