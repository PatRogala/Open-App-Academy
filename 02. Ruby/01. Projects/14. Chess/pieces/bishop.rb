# frozen_string_literal: true

require_relative 'piece'
require_relative '../modules/slideable'

# Class that represents a Bishop on the board
class Bishop < Piece
  include Slideable

  def symbol
    '♝'.colorize(color)
  end

  private

  def move_dirs
    diagonal_dirs
  end
end
