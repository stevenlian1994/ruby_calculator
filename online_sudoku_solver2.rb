class Sudoku
  SIZE = 9 
 NUMBERS = (1..9).to_a
 # CONSTANTS ARE ALL CAPS

  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE, nil) }
    # p "hello from intialize"
    # class instance 
  end

  def [](x,y)
  	# returns value on that matrix
    p @board[y][x]
  end

   def []=(x, y, value)
    raise "#{value} is not allowed in the row #{y}" unless allowed_in_row(y).include?(value)
    raise "#{value} is not allowed in the column #{x}" unless allowed_in_column(x).include?(value)
    @board[y][x] = value
  end

def to_s
    @board.map { |row| row.map { |x| if x.nil?; '-'; else x end }.join(' ') }.join("\n")
end

def row(y)
  Array.new(@board[y])
end

def column(x)
  @board.map { |row| row[x] }
end

def allowed_in_row(y)
  (NUMBERS - row(y)).uniq << nil
end

def allowed_in_column(x)
  (NUMBERS - column(x)).uniq << nil
end

  def print_board
  	p @board
  end
  
end

new_sudoku = Sudoku.new 
new_sudoku.[](1,1)

# new_sudoku.print_board

# p @board
# a.initialize
# p a.board 