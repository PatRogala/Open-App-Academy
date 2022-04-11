# frozen_string_literal: true

require_relative 'board'
require_relative 'human_player'

# class that indicates game of memory puzzle
class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
    @player = HumanPlayer.new
  end

  def play
    until over?
      @board.render
      pos = @player.propmt
      make_guess(pos)
    end

    puts 'You won!'
  end

  def over?
    @board.won?
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
