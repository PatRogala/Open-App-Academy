# frozen_string_literal: true

# module that hold useful UI methods
module UI
  def self.clear_screen
    system('clear') || system('cls')
  end

  def self.display_board(board)
    puts '  0 1 2 3 4 5 6 7 8'
    board.grid.each_with_index do |row, idx|
      puts "#{idx} " + row.map(&:to_s).join(' ')
    end
  end
end
