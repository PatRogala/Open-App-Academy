# frozen_string_literal: false

require 'set'
require_relative 'player'

# Game class for 'ghost' game
class Game
  VALID_LETTERS = Set.new('a'..'z')

  def initialize(*players)
    @players = players
    @dictionary = File.readlines('dictionary.txt').map(&:chomp).to_set
    @fragment = ''
    @losses = default_lose_hash
  end

  def default_lose_hash
    h = {}
    @players.each { |p| h[p.name] = 0 }
    h
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
    puts "Current fragment: #{@fragment}"
    letter = player.guess
    letter = player.guess until valid_play?(letter)
    @fragment << letter
  end

  def valid_play?(string)
    return false unless VALID_LETTERS.include?(string)

    potential_fragment = @fragment + string
    @dictionary.any? { |word| word.start_with?(potential_fragment) }
  end

  def no_more_plays?
    @dictionary.none? { |word| word.start_with?(@fragment) && word.length > @fragment.length }
  end

  def record(player)
    str = 'GHOST'
    str[0...@losses[player.name]]
  end

  def play_round
    if no_more_plays?
      @fragment = ''
      return @losses[current_player.name] += 1
    end

    display_standings
    take_turn(current_player)
    next_player!
  end

  def display_standings
    system('cls') || system('clear')
    puts "#{current_player.name}: #{record(current_player)}"
    puts "#{previous_player.name}: #{record(previous_player)}"
  end

  def run
    play_round until @losses.values.any? { |l| l == 5 }

    puts "It's over! Player #{previous_player.name} wins!"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(
    Player.new('Patryk'),
    Player.new('Olcia')
  )

  game.run
end
