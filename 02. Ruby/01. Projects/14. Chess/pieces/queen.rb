# frozen_string_literal: true

require_relative 'piece'
require_relative '../modules/slideable'

# Class that represents a Queen on the board
class Queen < Piece
  include Slideable

  def symbol
    '♛'.colorize(color)
  end

  protected

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end
