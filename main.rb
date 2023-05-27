require_relative 'game.rb'
require_relative 'player.rb'

tic = Game.new('X')
user = Player.new('X', "PLAYER")
comp = Player.new('O', "CPU")

current_player = user
turn = 0
active_game = true

while active_game do

  active_game = tic.make_move?(current_player)
  turn = (turn + 1)%2
  if turn == 0
    current_player = user
  else
    current_player = comp
  end


end