# frozen_string_literal: true

require_relative 'tree_node'

# Class that finds the shortest path between two points on a chess board
class KnightPathFinder
  def self.valid_moves(pos)
    pos_x, pos_y = pos
    moves = possible_moves(pos_x, pos_y)
    moves.select { |move| move.all? { |coord| coord.between?(0, 7) } }
  end

  def self.possible_moves(pos_x, pos_y)
    [[pos_x + 1, pos_y + 2], [pos_x + 1, pos_y - 2],
     [pos_x - 1, pos_y + 2], [pos_x - 1, pos_y - 2],
     [pos_x + 2, pos_y + 1], [pos_x + 2, pos_y - 1],
     [pos_x - 2, pos_y + 1], [pos_x - 2, pos_y - 1]]
  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    build_move_tree
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }
  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      current_node = queue.shift
      new_moves = make_move(current_node.value)
      new_moves.each do |move|
        new_node = PolyTreeNode.new(move)
        current_node.add_child(new_node)
        queue << new_node
      end
    end
  end

  def make_move(pos)
    moves = new_move_positions(pos)
    @considered_positions += moves
    moves
  end

  def find_path(end_pos)
    end_node = @root_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = []
    current_node = end_node
    until current_node.nil?
      path << current_node.value
      current_node = current_node.parent
    end
    path.reverse
  end
end
