# frozen_string_literal: true

require 'singleton'
require_relative 'piece'
require_relative '../modules/stepable'

# Class that represents a Knight on the board
class NullPiece < Piece
  include Singleton

  def initialize
    super(:none, nil, nil)
  end

  def moves
    []
  end

  def empty?
    true
  end

  def symbol
    ' '
  end
end
