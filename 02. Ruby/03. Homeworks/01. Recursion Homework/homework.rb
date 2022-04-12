# frozen_string_literal: true

def sum_to(num)
  return nil if num.negative?
  return num if num <= 1

  num + sum_to(num - 1)
end

def add_numbers(nums_array)
  return nil if nums_array.empty?
  return nums_array[0] if nums_array.length == 1

  nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(num)
  return nil if num <= 0
  return 1 if num == 1

  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.first == favorite

  ice_cream_shop(flavors.drop(1), favorite)
end

def reverse(string)
  return string if string.length <= 1

  string[-1] + reverse(string[0..-2])
end
