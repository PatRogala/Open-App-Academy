# frozen_string_literal: true

require_relative 'display'

# Class that represents Human Player
class Player
  attr_reader :color, :display

  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move
    start_pos = nil
    end_pos = nil

    until start_pos && end_pos
      display.render

      if start_pos
        puts "#{color}'s turn. Move to where?"
        end_pos = display.cursor.get_input

        display.reset! if end_pos
      else
        puts "#{color}'s turn. Move from where?"
        start_pos = display.cursor.get_input

        display.reset! if start_pos
      end
    end

    [start_pos, end_pos]
  end
end
