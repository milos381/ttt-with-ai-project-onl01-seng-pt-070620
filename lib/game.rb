class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  def current_player
    board.turn_count.even?  ? player_1 : player_2
  end
  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end
  def draw?
    board.full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    board.cells[won?[0]] if won?
  end
  def turn
#     If we can make a valid move update the board
#     OTHERWISE, in every other instance where there isn't a valid move run turn again
    input = current_player.move(input).to_i

    if board.valid_move?(input)
      board.update(input, current_player)
    else
      puts "That is an invalid move"
      turn
    end
  end
  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
