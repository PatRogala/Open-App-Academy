def partition(arr, num)
  less = []
  more = []
  arr.each do |el|
    if el < num
      less << el
    else
      more << el
    end
  end
  [less, more]
end

def merge(hash1, hash2)
  new_hash = {}
  hash1.each do |k, v|
    new_hash[k] = v
  end
  hash2.each do |k, v|
    new_hash[k] = v
  end
  new_hash
end

def censor(sentence, curse_words)
  words = sentence.split(' ')
  new_words = []
  words.each do |word|
    new_words << if curse_words.include?(word.downcase)
                   censor_word(word)
                 else
                   word
                 end
  end
  new_words.join(' ')
end

def censor_word(word)
  vowels = 'aeiou'
  new_word = ''
  word.each_char do |char|
    new_word << if vowels.include?(char.downcase)
                  '*'
                else
                  char
                end
  end
  new_word
end

# power_of_two?
# should accept a number as an arg
# should not use the built-in Math#log methods
# when the number is a power of two
#   should return true
# when the number is not a power of two
#   should return false (FAILED - 1)
def power_of_two?(num)
  return false if num < 1
  return true if num == 1

  power_of_two?(num / 2.0)
end
