require_relative 'human_player'
require_relative 'board'

class Game
  def initialize(player_1_mark, player_2_mark)
    @player_1_mark = player_1_mark
    @player_2_mark = player_2_mark
    @current_player = @player_1_mark
    @board = Board.new
  end

  def switch_turn
    @current_player = @current_player == @player_1_mark ? @player_2_mark : @player_1_mark
  end

  def play
    while @board.empty_positions?
      @board.print
      pos = @current_player.get_position
      @board.place_mark(pos, @current_player)
      if @board.win?(@current_player)
        puts "Player #{@current_player} wins!"
        return
      else
        switch_turn
      end
    end

    puts 'Draw!'
  end
end
