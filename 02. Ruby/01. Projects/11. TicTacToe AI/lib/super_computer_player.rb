require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)

    winner = node.children.find { |child| child.winning_node?(mark) }
    return winner.prev_move_pos if winner

    draw = node.children.find { |child| !child.losing_node?(mark) }
    return draw.prev_move_pos if draw

    raise "I can't lose!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts 'Play the brilliant computer!'
  hp = HumanPlayer.new('Jeff')
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
