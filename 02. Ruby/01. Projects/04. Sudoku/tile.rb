# frozen_string_literal: true

require 'colorize'

# Class that represents a tile on the board of sudoku
class Tile
  attr_accessor :value
  attr_reader :given

  def initialize(value, given)
    @value = value
    @given = given
  end

  def to_s
    @given ? @value.colorize(:green) : @value.colorize(:blue)
  end
end
