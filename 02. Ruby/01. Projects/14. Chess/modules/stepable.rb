# frozen_string_literal: true

# Module that contains the logic for stepping pieces
module Stepable
  def moves
    move_diffs.each_with_object([]) do |diff, moves|
      cur_x, cur_y = pos
      diff_x, diff_y = diff

      move = [cur_x + diff_x, cur_y + diff_y]
      next unless @board.valid_pos?(move)

      moves << move if @board.empty?(move) || @board[move].color != color
    end
  end

  private

  def move_diffs
    raise NotImplementedError
  end
end
