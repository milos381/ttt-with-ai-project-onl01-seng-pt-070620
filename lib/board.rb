class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
#Instance variables for an object will become attributes for that object
#When you assign @name = name for example name isn't the attribute accessor,
#it's just the value.
#The @name instance variable is what will be the attribute to be used elsewhere.
#So you've used an attr_accessor method to create an attribute of cell
#and it's value will be what the @cell instance variable is assigned to.
  end
  def reset!
    @cells = Array.new(9, " ")

  end
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  def position(input)
    input = input.to_i
    cells[input - 1]
  end
  def full?
    if cells.all? {|cell| cell == "X" || cell == "O"}
      return true
    else
      return false
    end
  end
  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end
  def taken?(input)
    input = input.to_i
    if cells[input - 1] == "X" || cells[input - 1] == "O"
      return true
    else
      return false
    end
  end
  def valid_move?(input)
    input = input.to_i
    if (input > 0 && input < 10) && !taken?(input)
      return true
    else
      return false
    end
  end
  def update(input, player)
    input = input.to_i
    cells[input - 1] = player.token
  end
end
