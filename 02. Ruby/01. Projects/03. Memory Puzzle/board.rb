# frozen_string_literal: true

require_relative 'card'

# class that indicates board
class Board
  CARD_PATTERN = ('A'..'Z').to_a

  def initialize
    @grid = Array.new(4) { Array.new(4) }
    @total_cards = 16
    populate
  end

  def populate
    cards = random_cards
    @grid.each do |row|
      row.each_index do |col|
        row[col] = cards.pop
      end
    end
  end

  def random_cards
    cards = []
    (@total_cards / 2).times do
      pattern = CARD_PATTERN.sample
      2.times do
        cards << Card.new(pattern)
      end
    end
    cards.shuffle
  end

  def render
    system('clear') || system('cls')
    puts '  0 1 2 3'
    @grid.each_with_index do |row, idx|
      puts "#{idx} #{row.map(&:to_s).join(' ')}"
    end
  end

  def won?
    @grid.all? do |row|
      row.all?(&:revealed)
    end
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    self[guessed_pos].value
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end
end
