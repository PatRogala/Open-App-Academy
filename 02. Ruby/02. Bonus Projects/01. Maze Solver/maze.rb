# frozen_string_literal: true

# Class that represents a maze
class Maze
  attr_reader :start, :end, :maze

  def self.from_file(file_name)
    maze = File.readlines(file_name).map do |line|
      line.chomp.split('')
    end

    Maze.new(maze)
  end

  def initialize(maze)
    @maze = maze
    @start = find_start
    @end = find_end
    @current = @start
  end

  def find_start
    @maze.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        return [row_index, col_index] if cell == 'S'
      end
    end
  end

  def find_end
    @maze.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        return [row_index, col_index] if cell == 'E'
      end
    end
  end

  def print
    system('cls') || system('clear')

    @maze.each do |row|
      puts row.join
    end
  end

  def valid_move?(pos)
    !['*', 'S', 'X'].include?(self[pos])
  end

  def [](pos)
    @maze[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @maze[pos[0]][pos[1]] = value
  end
end
