# frozen_string_literal: true

require_relative 'board'

# Class that represents a game of sudoku
class Game
  def initialize(board)
    @board = board
  end

  def play
    until @board.solved?
      @board.render
      pos = input_pos
      val = input_val
      @board[pos] = val
    end
    @board.render

    puts 'Congratulations, you win!'
  end

  private

  def input_pos
    puts 'Please enter a position on the board (e.g., "3,4")'
    parse_pos(gets.chomp)
  end

  def input_val
    puts 'Please enter a value between 1 and 9'
    gets.chomp
  end

  def parse_pos(str)
    str.split(',')
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.from_file('puzzles/sudoku1_almost.txt')
  Game.new(board).play
end
