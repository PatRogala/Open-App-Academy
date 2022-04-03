def zip(*arrays)
  arrays.transpose
end

def prizz_proc(arr, prc1, prc2)
  arr.reject { |el| prc1.call(el) == prc2.call(el) }
end

def zany_zip(*arrays)
  length = arrays.map(&:length).max

  (0...length).map do |i|
    arrays.map { |array| array[i] }
  end
end

def maximum(arr, &prc)
  return nil if arr.empty?

  max = arr.first
  arr.each do |el|
    max = el if prc.call(el) >= prc.call(max)
  end

  max
end

def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = [] }

  arr.each do |el|
    hash[prc.call(el)] << el
  end

  hash
end

def max_tie_breaker(arr, _prc, &blk)
  return nil if arr.empty?

  max = arr.first
  arr.each do |el|
    max = el if blk.call(el) > blk.call(max)
  end

  max
end

def silly_syllables(sentence)
  hash = Hash.new { |h, k| h[k] = [] }
  vowels = %w[a e i o u]
  words = sentence.split(' ')
  words.each do |word|
    word.each_char.with_index do |char, i|
      hash[word] << i if vowels.include?(char)
    end
  end

  words.map do |word|
    hash[word].size >= 2 ? word[hash[word].first..hash[word].last] : word
  end.join(' ')
end
