# frozen_string_literal: true

require_relative 'employee'

# Class that represents a menager
class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    @employees.map(&:salary).sum * multiplier
  end
end
