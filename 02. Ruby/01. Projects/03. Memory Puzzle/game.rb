# frozen_string_literal: true

require_relative 'board'

# class that indicates game of memory puzzle
class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
  end

  def play
    until over?
      @board.render
      pos = input_pos
      make_guess(pos)
    end
  end

  def over?
    @board.won?
  end

  def input_pos
    puts 'Enter a position on the board (e.g., "2,3")'
    gets.chomp.split(',').map(&:to_i)
  end

  def make_guess(pos)
    return first_card_guess(pos) if @previous_guess.nil?

    second_card_guess(pos)

    @previous_guess = nil
  end

  def first_card_guess(pos)
    @board[pos].reveal
    @previous_guess = pos
  end

  def second_card_guess(pos)
    @board[pos].reveal
    @board.render

    return if @board[pos] == @board[@previous_guess]

    sleep(1)
    @board[pos].hide
    @board[@previous_guess].hide
  end
end

Game.new.play if __FILE__ == $PROGRAM_NAME
