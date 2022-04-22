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

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = pos
    moves = []
    loop do
      cur_x += dx
      cur_y += dy
      pos = [cur_x, cur_y]

      break unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      else
        # can take an opponent's piece
        moves << pos if board[pos].color != color

        # can't move past blocking piece
        break
      end
    end
    moves
  end

  def valid_unblocked_move?(cur_pos)
    @board.valid_pos?(cur_pos) && @board[cur_pos].empty?
  end
end
