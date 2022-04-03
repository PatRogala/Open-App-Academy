def is_prime?(num)
  return false if num < 2

  (2..Math.sqrt(num)).each do |i|
    return false if (num % i).zero?
  end
  true
end

def nth_prime(num)
  count = 0
  i = 2
  while count < num
    count += 1 if is_prime?(i)
    i += 1
  end
  i - 1
end

def prime_range(min, max)
  (min..max).select { |i| is_prime?(i) }
end
