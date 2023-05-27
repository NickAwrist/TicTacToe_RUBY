class Player
  attr_accessor :piece, :name

  def initialize(piece = 'X', name = "CPU")
    @piece = piece
    @name = name
  end

end