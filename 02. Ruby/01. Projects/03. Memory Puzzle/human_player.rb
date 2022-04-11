# frozen_string_literal: true

# Human player for our game
class HumanPlayer
  def initialize; end

  def propmt
    puts "Enter a position on the board (e.g., '2,3')"
    gets.chomp.split(',').map(&:to_i)
  end
end
