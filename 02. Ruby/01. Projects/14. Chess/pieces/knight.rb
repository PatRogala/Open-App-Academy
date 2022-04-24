# frozen_string_literal: true

require_relative 'piece'
require_relative '../modules/stepable'

# Class that represents a Knight on the board
class Knight < Piece
  include Stepable

  def symbol
    '♞'.colorize(color)
  end

  protected

  def move_diffs
    [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end
end
