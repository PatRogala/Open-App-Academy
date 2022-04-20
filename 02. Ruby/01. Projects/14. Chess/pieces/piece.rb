# frozen_string_literal: true

# Class that represents a piece on the board
class Piece
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end
