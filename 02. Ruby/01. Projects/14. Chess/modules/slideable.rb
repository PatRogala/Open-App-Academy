# frozen_string_literal: true

# Module that contains the logic for sliding pieces
module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]].freeze

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    moves
  end

  private

  def move_dirs
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(delta_x, delta_y)
    moves = []
    cur_pos = [@pos[0] + delta_x, @pos[1] + delta_y]
    while valid_unblocked_move?(pos)
      moves << cur_pos
      cur_pos = [cur_pos[0] + delta_x, cur_pos[1] + delta_y]
    end
    moves << cur_pos if @board.valid_pos?(cur_pos) && @board[cur_pos].color != @color
    moves
  end

  def valid_unblocked_move?(cur_pos)
    @board.valid_pos?(cur_pos) && @board[cur_pos].empty?
  end
end
