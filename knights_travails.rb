class Vertex
  attr_accessor :coordinate

  def initialize
    @coordinate = []
  end
end

class Graph
  attr_accessor :root

  def initialize
    @root = []
  end
end

class Knight
  attr_accessor :current_location

  def initialize
    # @current_location
  end

  def all_moves
    # method to create a graph of all possible moves
  end

  def knight_moves
    # Use the chosen search algorithm to find the shortest path between
    # the starting square (or node) and the ending square.
  end
end

class GameBoard
  attr_reader :board

  def initialize
    @board = create_board
  end

  def create_board
    array = []
    8.times do |x|
      8.times do |y|
        coordinate = [x, y]
        array << coordinate
      end
    end
    array
  end
end

new_knight = Knight.new
new_board = GameBoard.new
p new_board.board