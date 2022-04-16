# frozen_string_literal: true

# Class that represents a tile on the board of minesweeper
class Tile
  attr_accessor :pos
  attr_reader :revealed, :bombed

  def initialize(pos, board)
    @board = board
    @revealed = false
    @flagged = false
    @bombed = false
    @pos = pos
  end

  def flag
    return if @revealed

    @flagged = !@flagged
  end

  def reveal
    return if @revealed || @flagged

    @revealed = true
    neighbors.each(&:reveal) if neighbor_bomb_count.zero?
  end

  def neighbors
    neighbors = []
    (-1..1).each do |row_offset|
      (-1..1).each do |col_offset|
        next if row_offset.zero? && col_offset.zero?

        pos = [@pos[0] + row_offset, @pos[1] + col_offset]
        next if invalid_pos?(pos)

        neighbors << @board[pos]
      end
    end
    neighbors
  end

  def invalid_pos?(pos)
    pos[0].negative? || pos[0] > 8 || pos[1].negative? || pos[1] > 8
  end

  def neighbor_bomb_count
    neighbors.count(&:bombed)
  end

  def plant_bomb
    @bombed = true
  end

  def value
    neighbor_bomb_count.zero? ? '_' : neighbor_bomb_count
  end

  def to_s
    if @flagged
      'F'
    elsif @revealed
      @bombed ? '*' : value
    else
      'O'
    end
  end
end
