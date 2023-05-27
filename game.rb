require_relative 'game.rb'

class Game

  @moves = [1, 0, -1, 0, 0, 1, 0, -1, 1, 1, -1, -1, 1, -1, -1, 1]

  def initialize(piece = 'X')
    @piece = piece
    @size = 3
    @total_moves = 0

    if @piece == 'x' or @piece == 'o'
      @piece = @piece.capitalize
    end

    @cpu_piece = 'O'
    if @piece == 'O'
      @cpu_piece = 'X'
    end

    ## Initialize Board
    @board = Array.new
    cell = ' '
    @size.times do

      row = Array.new
      @size.times do
        row.append(cell)
      end
      @board.append(row)

    end

  end

  def print_board

    print "---"
    (@size).times { |i| print "#{i}---" }

    print "\n"
    @size.times do |i|

      print "#{i}| "
      @size.times do |j|
        print @board[i][j]+" | "
      end
      print "\n"
    end
    (@size+1).times { print "---" }

    puts "\n"

  end

  def make_move?(player)

    puts "\nInput a row and column. EX: 2 1  for row 2 column 1"
    input_arr = gets.chomp.split.map { |e| e.to_i }
    row = input_arr[0]
    col = input_arr[1]

    until valid_move?(row, col) do
      input_arr = gets.chomp.split.map { |e| e.to_i }
      row = input_arr[0]
      col = input_arr[1]
    end

    # Place piece on the board and increment total_moves
    @board[row][col] = player.piece
    @total_moves = @total_moves + 1

    # Print the board
    print_board

    # Check if board is complete
    if check_win?(row, col, player)
      puts player.name+" WINS!"
      return false
    end

    # Check if match ended in a draw
    if @total_moves >= @size ** 2
      puts "The board is full, match ends in a draw!"
      return false
    end

    true

  end

  def valid_move?(row, col)

    if row >= @size or col >=@size
      puts "Out of bounds. Please enter a new position."
      return false
    end

    if @board[row][col] == 'X' or @board[row][col] == 'O'
      puts "Spot is already taken. Pleas enter a new position."
      return false
    end

    true
  end

  # Check if player has won
  def check_win?(row, col, player)

    (check_vert?(col, player) or check_hor?(row, player) or check_dia?(player))

  end

  # Check to see if a column is full of same piece
  private def check_vert?(col, player){}

    count = 0
    @size.times do |i|
      if @board[i][col] == player.piece
        count = count +1
      end
    end

  count >= @size

  end

  # Check to see if a row is full of same piece
  private def check_hor?(row, player){}

    count = 0
    @size.times do |i|
      if @board[row][i] == player.piece
        count = count +1
      end
    end

    count >= @size

  end

  # Check to see if a diagonal is full of the same piece
  private def check_dia?(player)

    up_to_down = 0
    down_to_up = 0

    @size.times do |i|
      if @board[i][i] == player.piece
        up_to_down = up_to_down + 1
      end

      if @board[@size-1-i][i] == player.piece
        down_to_up = down_to_up + 1
      end

    end

    down_to_up >= @size or up_to_down >= @size

  end

end