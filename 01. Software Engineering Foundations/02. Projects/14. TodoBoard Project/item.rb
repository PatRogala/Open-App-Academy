require 'date'

class Item
  attr_accessor :title, :description
  attr_reader :deadline

  def self.valid_date?(date_string)
    date = date_string.split('-').map(&:to_i)
    date[0].to_s.length == 4 && date[1].between?(1, 12) && date[2].between?(1, 31)
  end

  def initialize(title, deadline, description)
    @title = title
    @deadline = deadline
    @description = description
    raise 'invalid date' unless Item.valid_date?(deadline)
  end

  def deadline=(new_deadline)
    raise 'invalid date' unless Item.valid_date?(new_deadline)

    @deadline = new_deadline
  end
end
