# frozen_string_literal: true

# Class that represents game of simon
class Simon
  COLORS = %w[red blue green yellow].freeze

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
    end
  end

  def require_sequence
    puts 'Enter the sequence'
    @seq.each do |color|
      input = gets.chomp
      if input != color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    'Round successful'
  end

  def game_over_message
    'Game over'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
