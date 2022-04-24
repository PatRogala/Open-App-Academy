# frozen_string_literal: true

require 'io/console'

KEYMAP = {
  ' ' => :space,
  'h' => :left,
  'j' => :down,
  'k' => :up,
  'l' => :right,
  'w' => :up,
  'a' => :left,
  's' => :down,
  'd' => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c
}.freeze

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}.freeze

# Class that represents position of cursor
class Cursor
  attr_reader :cursor_pos, :board, :selected

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  def toggle_selected
    @selected = !@selected
  end

  private

  def read_char
    $stdin.echo = false

    $stdin.raw!

    input = $stdin.getc.chr

    if input == "\e"
      begin
        input << $stdin.read_nonblock(3)
      rescue StandardError
        nil
      end

      begin
        input << $stdin.read_nonblock(2)
      rescue StandardError
        nil
      end
    end

    $stdin.echo = true
    $stdin.cooked!

    input
  end

  def handle_key(key)
    case key
    when :ctrl_c
      exit 0
    when :return, :space
      toggle_selected
      cursor_pos
    when :left, :right, :up, :down
      update_pos(MOVES[key])
      nil
    else
      puts key
    end
  end

  def update_pos(diff)
    new_pos = [cursor_pos[0] + diff[0], cursor_pos[1] + diff[1]]
    @cursor_pos = new_pos if board.valid_pos?(new_pos)
  end
end
