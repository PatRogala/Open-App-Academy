# frozen_string_literal: true

# class for player in ghost game
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    print 'Type letter: '
    gets.chomp.downcase
  end
end
