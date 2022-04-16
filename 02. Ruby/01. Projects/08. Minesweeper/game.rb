# frozen_string_literal: true

require_relative 'board'

puts ARGV[0]
require 'pry'
binding.pry

board = if ARGV[1]
          YAML.load_file(ARGV[1])
        else
          Board.new
        end

board.run
