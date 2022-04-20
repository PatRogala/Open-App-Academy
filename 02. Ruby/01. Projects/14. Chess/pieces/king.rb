# frozen_string_literal: true

require_relative 'piece'
require_relative '../modules/stepable'

# Class that represents a King on the board
class King < Piece
  include Stepable

  def symbol
    '♚'.colorize(color)
  end

  protected

  def move_diffs
    [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1]]
  end
end
