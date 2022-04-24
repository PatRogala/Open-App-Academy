# frozen_string_literal: true

require_relative 'piece'
require_relative '../modules/slideable'

# Class that represents a Rook on the board
class Rook < Piece
  include Slideable

  def symbol
    '♜'.colorize(color)
  end

  protected

  def move_dirs
    horizontal_dirs
  end
end
