def palindrome?(string)
  string.each_char.with_index do |char, index|
    return false if char != string[string.length - index - 1]
  end

  true
end

def substrings(string)
  substrings = []
  (0...string.length).each do |index|
    (index...string.length).each do |sub_index|
      substrings << string[index..sub_index]
    end
  end

  substrings
end

def palindrome_substrings(string)
  substrings(string).select { |substring| palindrome?(substring) && substring.length > 1 }
end
