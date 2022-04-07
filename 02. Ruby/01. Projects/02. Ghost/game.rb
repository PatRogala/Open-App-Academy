# frozen_string_literal: true

require 'set'
require_relative 'player'

# Game class for 'ghost' game
class Game
  VALID_LETTERS = Set.new('a'..'z')

  def initialize(*players)
    @players = players
    @dictionary = File.readlines('dictionary.txt').map(&:chomp).to_set
    @fragment = ''
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def take_turn(player)
    puts "#{player.name}: #{@fragment}"
    letter = player.guess(@fragment)
    letter = player.guess(@fragment) until valid_play?(letter)
    @fragment << letter
  end

  def valid_play?(string)
    return false unless VALID_LETTERS.include?(string)

    potential_fragment = @fragment + string
    @dictionary.any? { |word| word.start_with?(potential_fragment) }
  end
end
