class Vertex
  attr_accessor \
    :coordinate,
    :parent

  def initialize(coordinate, parent)
    @coordinate = coordinate
    @parent = parent
  end
end

class Graph
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_graph(current_position, end_position, array, current_vertex = nil, queue = [], values = [], parent = nil)
    # create the first vertex
    if current_vertex.nil?
      current_vertex = Vertex.new(current_position, nil)
      queue << current_vertex
    end

    # add current_position to list of spaces visited and remove it from queue
    values << current_vertex
    queue.shift

    return if current_position == end_position

    # create all 8 possible options (if valid) and add to queue
    current_position_moves = [[current_position[0] - 1, current_position[1] + 2],
                              [current_position[0] + 1, current_position[1] + 2],
                              [current_position[0] + 2, current_position[1] + 1],
                              [current_position[0] + 2, current_position[1] - 1],
                              [current_position[0] + 1, current_position[1] - 2],
                              [current_position[0] - 1, current_position[1] - 2],
                              [current_position[0] - 2, current_position[1] - 1],
                              [current_position[0] - 2, current_position[1] + 1]]

    # add possible moves as vertices to queue if they're within the board
    8.times do |x|
      if array.include? current_position_moves[x] then queue << Vertex.new(current_position_moves[x], current_vertex) end
    end

    # call build_graph on first item in queue
    build_graph(queue[0].coordinate, end_position, array, queue[0], queue, values, parent)

    # return values array
    values
  end
end

class Knight
  attr_accessor :game_board

  def initialize
    @game_board = create_board
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

  def knight_moves(start_position, end_position)
    unless @game_board.include? start_position
      puts 'Invalid starting position'
      return
    end
    unless @game_board.include? end_position
      puts 'Invalid starting position'
      return
    end

    moves_graph = Graph.new.build_graph(start_position, end_position, @game_board)

    current_vertex = moves_graph[-1]
    values = []
    moves_graph.length.times do
      values << current_vertex.coordinate
      current_vertex = current_vertex.parent
      if current_vertex.coordinate == start_position
        values << current_vertex.coordinate
        break
      end
    end

    puts "You made it in #{values.length} moves!  Here's your path:"
    values.reverse.each do |move|
      p move
    end
  end
end

new_knight = Knight.new
new_knight.knight_moves([1, 5], [4, 0])
