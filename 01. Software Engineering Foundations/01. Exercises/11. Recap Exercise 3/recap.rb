def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
  end
  hash.select { |_k, v| v == 1 }.keys
end

def no_consecutive_repeats?(arr)
  arr.each_cons(2).all? { |a, b| a != b }
end

def char_indices(str)
  hash = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index do |char, idx|
    hash[char] << idx
  end
  hash
end

def longest_streak(str)
  hash = char_indices(str)
  hash.values.map(&:size).max
end

def bi_prime?(num)
  (2..num).each do |i|
    return true if prime?(i) && prime?(num / i)
  end
  false
end

def vigenere_cipher(message, keys)
  alpha = ('a'..'z').to_a
  message.each_char.with_index.map do |char, idx|
    alpha.rotate(keys[idx % keys.size]).find_index(char)
  end.map(&:to_s).join
end

def vowel_rotate(str)
  vowels = %w[a e i o u]
  str.each_char.with_index.map do |char, idx|
    vowels.rotate(idx).find_index(char)
  end.map(&:to_s).join
end

class String
  def select(&prc)
    arr = []
    each_char do |char|
      arr << char if prc.call(char)
    end
    arr
  end

  def map!(&prc)
    each_char.with_index do |char, idx|
      self[idx] = prc.call(char)
    end
    self
  end
end

def multiply(a, b)
  return 0 if a.zero? || b.zero?
  return a if b == 1
  return b if a == 1
  return multiply(b, a) if a > b

  a + multiply(a, b - 1)
end

def lucas_sequence(num)
  return [] if num.zero?
  return [2] if num == 1
  return [2, 1] if num == 2

  lucas_sequence(num - 1) << lucas_sequence(num - 1).last + lucas_sequence(num - 2).last
end

def prime_factorization(num)
  return [] if num == 1
  return [num] if prime?(num)

  (2..num).each do |i|
    return [i] + prime_factorization(num / i) if (num % i).zero?
  end
end
