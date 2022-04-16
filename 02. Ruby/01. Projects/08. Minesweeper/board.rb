# frozen_string_literal: true

require 'yaml'

require_relative 'tile'
require_relative 'ui'

# Class that represents a board of minesweeper
class Board
  attr_reader :grid

  def initialize
    generate_grid
  end

  def run
    until over?
      UI.clear_screen
      UI.display_board(self)
      input = gets.chomp.split(' ')
      make_move(input)
    end

    UI.clear_screen
    UI.display_board(self)
    puts 'You lose!' if lost?
    puts 'You win!' if won?
  end

  def make_move(input)
    return save_game(input) if input[0] == 'save'

    pos = input[1].split(',').map(&:to_i)
    input[0] == 'f' ? flag(pos) : reveal(pos)
  end

  def save_game(input)
    File.open(input[1], 'w') do |f|
      f.write(to_yaml)
    end
  end

  def flag(pos)
    self[pos].flag
  end

  def reveal(pos)
    self[pos].reveal
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def generate_grid
    @grid = Array.new(9) { Array.new(9) { Tile.new([0, 0], self) } }

    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |tile, col_idx|
        tile.pos = [row_idx, col_idx]
      end
    end
    seed_random_mines
  end

  def seed_random_mines
    @grid.each do |row|
      row.each do |tile|
        tile.plant_bomb if rand(10) == 1
      end
    end
  end

  def update_tile_values
    @grid.each do |row|
      row.each do |tile|
        tile.value = tile.neighbor_bomb_count unless tile.bombed
      end
    end
  end

  def over?
    won? || lost?
  end

  def won?
    !lost?
  end

  def lost?
    @grid.flatten.any? { |t| t.bombed && t.revealed }
  end
end
