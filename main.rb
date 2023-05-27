require_relative 'game.rb'
require_relative 'player.rb'

tic = Game.new('X')
user1 = Player.new('X', "PLAYER 1")
user2 = Player.new('O', "PLAYER 2")

current_player = user1
turn = 0
active_game = true

while active_game do

  active_game = tic.make_move?(current_player)
  turn = (turn + 1)%2
  if turn == 0
    current_player = user1
  else
    current_player = user2
  end


end