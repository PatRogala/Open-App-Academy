def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |dog| dog['age'] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |sub_arr| sub_arr.sum.positive? }
end

def aba_translate(word)
  vowels = 'aeiou'
  new_word = ''
  word.each_char do |char|
    new_word << if vowels.include?(char)
                  "#{char}b#{char}"
                else
                  char
                end
  end
  new_word
end

def aba_array(array)
  array.map { |word| aba_translate(word) }
end
