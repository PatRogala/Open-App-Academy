class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(' ')
    end
  end

  def initialize(size)
    @grid = Array.new(size) { Array.new(size, :N) }
    @size = size * size
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p 'you sunk my battleship!'
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    num_ships = @size / 4
    while self.num_ships < num_ships
      pos = [rand(0...@grid.length), rand(0...@grid.length)]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
