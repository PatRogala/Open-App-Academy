class Player
  def get_move
    print 'enter a position with coordinates separated with a space like `4 7`: '
    input = gets.chomp
    [input[0].to_i, input[2].to_i]
  end
end
