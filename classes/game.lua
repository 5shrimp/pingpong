local Game = Classic:extend()

function Game:new()
  self.players = {
    left = {
      object = Player(100, 200, PlayerInputScheme.wasd),
      score = 0
    },
    right = {
      object = Player(700, 200, PlayerInputScheme.arrows),
      score = 0
    }
  }

  self.ball = Ball(300, 100)
  self.ball:go()

  self.blasts = {}

  self.hitHandler = Event.on('hit', function(side)
    self:hitBy(self.players[side])
   end)
end

function Game:hitBy(player)
  local blast = Blast(self.ball.x, self.ball.y)
  table.insert(self.blasts, blast)

  player.score = player.score + 1
  self:printScore()
  self.ball:reset()
  self.ball:go()
end

function Game:printScore()
  print("left:"..self.players.left.score..", right:"..self.players.right.score)
end

function Game:isOver()
  --
end

function Game:reset()
  --
end

return Game
