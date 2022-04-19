# frozen_string_literal: true

require_relative 'tic_tac_toe'

# Class that represents a node in the Tic Tac Toe game tree
class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return board.won? && board.winner != evaluator if board.over?

    my_turn = (next_mover_mark == evaluator)
    if my_turn
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    return board.winner == evaluator if board.over?

    my_turn = (next_mover_mark == evaluator)
    if my_turn
      children.any? { |child| child.winning_node?(evaluator) }
    else
      children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        next unless board.empty?([row_idx, col_idx])

        children << create_child(row_idx, col_idx)
      end
    end

    children
  end

  def create_child(row_idx, col_idx)
    new_board = board.dup
    new_board[[row_idx, col_idx]] = next_mover_mark
    next_mark = (@next_mover_mark == :x ? :o : :x)
    TicTacToeNode.new(new_board, next_mark, [row_idx, col_idx])
  end
end
