class HumanPlayer
  attr :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    puts "Please enter a position (e.g. '1,3')"
    position = gets.chomp
    position.split(',').map(&:to_i)
  end
end
