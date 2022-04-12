# frozen_string_literal: true

def exp1(base, power)
  return 1 if power.zero?

  base * exp(base, power - 1)
end

def exp2(base, num)
  return 1 if num.zero?
  return base if num == 1
  return exp(base, num / 2) * exp(base, num / 2) if num.even?
  return base * exp(base, (num - 1) / 2) * exp(base, (num - 1) / 2) if num.odd?
end

class Array
  def deep_dup
    new_array = []
    each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end
end

def fibonacci(num)
  return [0] if num == 1
  return [0, 1] if num == 2

  fib = fibonacci(num - 1)
  fib << fib[-1] + fib[-2]
end

def bsearch(array, target)
  return nil if array.empty?

  mid = array.length / 2
  left = array[0...mid]
  right = array[mid + 1..-1]

  return mid if array[mid] == target

  return bsearch(left, target) if target < array[mid]

  result = bsearch(right, target)
  result.nil? ? nil : mid + 1 + result
end

def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left = array[0...mid]
  right = array[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []
  sorted << (left.first < right.first ? left.shift : right.shift) until left.empty? || right.empty?
  sorted + left + right
end

def subsets(array)
  return [[]] if array.empty?

  subs = subsets(array[0...-1])
  subs + subs.map { |sub| sub + [array.last] }
end

def permutations(array)
  return [array] if array.length <= 1

  last = array.pop
  perms = permutations(array)
  perms.product(perms).map { |perm| perm.unshift(last) }
end
