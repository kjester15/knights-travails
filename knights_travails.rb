class Vertex
  attr_accessor \
    :coordinate,
    :option1,
    :option2,
    :option3,
    :option4,
    :option5,
    :option6,
    :option7,
    :option8

  def initialize(coordinate)
    @coordinate = coordinate
    @option1 = nil
    @option2 = nil
    @option3 = nil
    @option4 = nil
    @option5 = nil
    @option6 = nil
    @option7 = nil
    @option8 = nil
  end
end

class Graph
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_graph(current_position, end_position, array, queue = [], values = [])
    # take the current position, and map out moves on a BFS basis, until end_position is found

    return if values.include? end_position

    # add current_position to queue on first call
    if queue.empty?
      queue << current_position
    end

    # add current_position to list of spaces visited and remove it from queue
    values << queue[0]
    queue.shift

    # create the root using current position
    @root = Vertex.new(current_position)

    # create all 8 possible options (if valid) and add to queue
    current_position_moves = [[current_position[0] - 1, current_position[1] + 2],
                              [current_position[0] + 1, current_position[1] + 2],
                              [current_position[0] + 2, current_position[1] + 1],
                              [current_position[0] + 2, current_position[1] - 1],
                              [current_position[0] + 1, current_position[1] - 2],
                              [current_position[0] - 1, current_position[1] - 2],
                              [current_position[0] - 2, current_position[1] - 1],
                              [current_position[0] - 2, current_position[1] + 1]]

    # add possible moves to queue if they're within the board
    8.times do |x|
      if array.include? current_position_moves[x] then queue << current_position_moves[x] end
    end

    # call build_graph on first item in queue
    build_graph(queue[0], end_position, array, queue, values)

    # return values array
    values
  end
end

class Knight
  attr_accessor

  def initialize
    @game_board = GameBoard.new
  end

  def knight_moves(current_position, end_position)
    # Use the chosen search algorithm to find the shortest path between
    # the starting square (or node) and the ending square.
    moves_graph = Graph.new.build_graph(current_position, end_position, @game_board.board)
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
p new_knight.knight_moves([3, 5], [7, 7])
