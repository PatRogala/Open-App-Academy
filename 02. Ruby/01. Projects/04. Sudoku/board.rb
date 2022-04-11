# frozen_string_literal: true

require_relative 'tile'

# Class that represents a board of sudoku
class Board
  def self.from_file(file_name)
    file = File.open(file_name, 'r')
    grid = file.map do |line|
      line.chomp!
      line.split('').map do |val|
        Tile.new(val, val != '0')
      end
    end

    Board.new(grid)
  end

  def [](pos)
    row, col = pos.map(&:to_i)
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos.map(&:to_i)
    @grid[row][col].value = val unless @grid[row][col].given
  end

  def initialize(grid)
    @grid = grid
  end

  def render
    system('clear') || system('cls')
    @grid.each do |row|
      puts row.map(&:to_s).join(' ')
    end
  end

  def solved?
    columns_solved? && rows_solved? && squares_solved?
  end

  def rows_solved?
    @grid.all? do |row|
      row.all? { |tile| tile.value != '0' } && row.map(&:value).uniq.length == 9
    end
  end

  def columns_solved?
    @grid.transpose.all? do |row|
      row.all? { |tile| tile.value != '0' } && row.map(&:value).uniq.length == 9
    end
  end

  def squares_solved?
    squares.all? do |square|
      square.all? { |tile| tile.value != '0' } && square.map(&:value).uniq.length == 9
    end
  end

  def squares
    (0..8).to_a.map { |i| square(i) }
  end

  def square(idx)
    tiles = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i, j]]
      end
    end

    tiles
  end
end
