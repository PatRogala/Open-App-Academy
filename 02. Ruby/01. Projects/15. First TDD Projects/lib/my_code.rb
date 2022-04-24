# frozen_string_literal: true

def my_uniq(array)
  new_array = []
  array.each { |element| new_array << element unless new_array.include?(element) }
  new_array
end

def two_sum(array)
  new_array = []
  array.each_with_index do |element, index|
    (index...array.length).each do |index2|
      new_array << [index, index2] if (element + array[index2]).zero? && index != index2
    end
  end
  new_array
end

def my_transpose(array)
  new_array = []
  array.each_with_index do |row, row_index|
    new_row = []
    row.each_with_index do |_, column_index|
      new_row << array[column_index][row_index]
    end
    new_array << new_row
  end
  new_array
end
