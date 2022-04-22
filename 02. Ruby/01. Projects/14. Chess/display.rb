# frozen_string_literal: true

require 'colorize'
require_relative 'cursor'

# Class that represents a state of the board
class Display
  attr_reader :board, :notifications, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
    @notifications = {}
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, index)
    row.map.with_index do |piece, j|
      color_options = colors_for(index, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(pos_x, pos_y)
    bg = if cursor.cursor_pos == [pos_x, pos_y] && cursor.selected
           :light_green
         elsif cursor.cursor_pos == [pos_x, pos_y]
           :light_red
         elsif (pos_x + pos_y).odd?
           :light_blue
         else
           :light_yellow
         end
    { background: bg }
  end

  def reset!
    @notifications.delete(:error)
  end

  def uncheck!
    @notifications.delete(:check)
  end

  def set_check!
    @notifications[:check] = 'Check!'
  end

  def render
    system('clear')
    puts 'Arrow keys or WASD to move, space or enter to confirm.'
    build_grid.each { |row| puts row.join }

    @notifications.each do |_key, val|
      puts val
    end
  end
end
