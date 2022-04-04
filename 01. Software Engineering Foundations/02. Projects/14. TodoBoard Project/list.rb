require_relative 'item'

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = '')
    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.size
  end

  def valid_index?(index)
    (0...@items.size).include?(index)
  end

  def swap(index1, index2)
    return false unless valid_index?(index1) && valid_index?(index2)

    @items[index1], @items[index2] = @items[index2], @items[index1]
    true
  end

  def [](index)
    return nil unless valid_index?(index)

    @items[index]
  end

  def priority
    @items.first
  end

  def print
    puts '-' * 42
    puts @label.upcase.to_s.center(42)
    puts '-' * 42
    puts 'Index | Item                 | Deadline'
    puts '-' * 42
    @items.each_with_index do |item, idx|
      puts "#{idx.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline}"
    end
    puts '-' * 42
  end

  def print_full_item(index)
    return false unless valid_index?(index)

    item = self[index]

    puts '-' * 42
    puts item.title.ljust(32) + item.deadline.to_s
    puts item.description unless item.description.empty?
    puts '-' * 42
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount = 1)
    return false unless valid_index?(index)

    while amount.positive?
      swap(index, index - 1)
      amount -= 1
      index -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false unless valid_index?(index)

    while amount.positive?
      swap(index, index + 1)
      amount -= 1
      index += 1
    end
    true
  end

  def sort_by_date!
    @items.sort_by!(&:deadline)
  end
end
