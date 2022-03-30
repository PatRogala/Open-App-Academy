# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if empty?

    max - min
  end

  def average
    return nil if empty?

    sum / size.to_f
  end

  def median
    return nil if empty?

    size.odd? ? sort[(size / 2)] : sort[size / 2 - 1..size / 2].average
  end

  def counts
    hash = Hash.new(0)

    each { |el| hash[el] += 1 }
    hash
  end

  def my_count(arg)
    self.select { |el| arg == el }.size
  end

  def my_index(arg)
    each_with_index do |ele, i|
      return i if ele == arg
    end
    nil
  end

  def my_uniq
    each_with_object([]) do |ele, arr|
      arr << ele unless arr.include?(ele)
    end
  end

  def my_transpose
    each_with_object([]) do |row, arr|
      row.each_with_index do |ele, i|
        arr[i] ||= []
        arr[i] << ele
      end
    end
  end
end
