# frozen_string_literal: true

# Class that represents an employee
class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss

    boss.employees << self if boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end
