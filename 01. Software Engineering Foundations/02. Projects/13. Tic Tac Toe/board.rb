class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def valid?(position)
    position.each do |coord|
      return false if coord.negative? || coord > 2
    end
    true
  end

  def empty?(position)
    x, y = position
    @grid[x][y] == '_'
  end

  def place_mark(position, mark)
    raise 'Invalid position' unless valid?(position) && empty?(position)

    x, y = position
    @grid[x][y] = mark
  end

  def print
    @grid.each do |row|
      puts row.join(' ')
    end
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all? { |cell| cell == mark }
    end
  end

  def win_col?(mark)
    @grid.transpose.any? do |col|
      col.all? { |cell| cell == mark }
    end
  end

  def win_diagonal?(mark)
    @grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark ||
      @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.flatten.any? { |cell| cell == '_' }
  end
end
