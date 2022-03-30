# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'prime'

def largest_prime_factor(number)
  number.downto(1) do |i|
    return i if Prime.prime?(i) && (number % i).zero?
  end
end

def unique_chars?(str)
  str.chars.uniq.join == str
end

def dupe_indices(arr)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each_with_index do |el, i|
    hash[el] << i
  end
  hash.select { |_, v| v.size > 1 }
end

def ana_array(arr1, arr2)
  arr1.all? { |el| arr2.include?(el) } && arr2.all? { |el| arr1.include?(el) }
end
