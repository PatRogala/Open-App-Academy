# Write a method, multi_dimensional_sum(array), that accepts a multidimensional array as an arg
# and returns the sum of all numbers in the array.

def multi_dimensional_sum(array)
  array.flatten.inject(:+)
end

arr1 = [
  [4, 3, 1],
  [8, 1],
  [2]
]

p multi_dimensional_sum(arr1)    # => 19

arr2 = [
  [[3, 6], [7]],
  [[5, 2], 1]
]

p multi_dimensional_sum(arr2)    # => 24
