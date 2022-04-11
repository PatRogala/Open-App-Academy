# frozen_string_literal: true

# class that indicates board
class Board
  CARD_PATTERN = ('A'..'Z').to_a

  def initialize
    @grid = Array.new(4) { Array.new(4) }
    @total_cards = 16
  end

  def populate; end
end
