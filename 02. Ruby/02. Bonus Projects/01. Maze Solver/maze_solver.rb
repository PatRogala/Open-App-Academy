# frozen_string_literal: true

require_relative 'maze'

# class that represents maze solver to find end
class MazeSolver
  def initialize(maze)
    @maze = maze
    @start = maze.start
    @end = maze.end
    @current = @start
    @path = []
  end

  def solve
    until solved?
      @maze.print
      make_move
      sleep(0.1)
    end

    puts 'You solved the maze!'
    puts "It took you #{@path.length} moves."
    puts "The path is #{@path.join}"
  end

  def solved?
    @end == @current
  end

  def make_move
    best_move = possible_moves.min_by do |move|
      move_cost(move)
    end

    @maze[best_move] = 'X'

    @path << arrow(best_move)
    @current = best_move
  end

  def possible_moves
    moves = [[-1, 0], [1, 0], [0, -1], [0, 1]] # UP, DOWN, LEFT, RIGHT

    moves.map! do |move|
      [@current[0] + move[0], @current[1] + move[1]]
    end

    moves.select { |move| @maze.valid_move?(move) }
  end

  def move_cost(move)
    (@end[0] - move[0]).abs + (@end[1] - move[1]).abs
  end

  def arrow(best_move)
    return '↓' if @current[0] < best_move[0]
    return '↑' if @current[0] > best_move[0]
    return '→' if @current[1] < best_move[1]
    return '←' if @current[1] > best_move[1]
  end
end

if __FILE__ == $PROGRAM_NAME
  file_name = ARGV[0]
  maze = Maze.from_file(file_name)
  solver = MazeSolver.new(maze)
  solver.solve
end
