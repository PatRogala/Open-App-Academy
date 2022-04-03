def element_count(array)
  array.each_with_object(Hash.new(0)) { |element, count| count[element] += 1 }
end

def char_replace!(string, hash)
  string.each_char.with_index do |char, i|
    string[i] = hash[char] if hash.key?(char)
  end
end

def product_inject(array)
  array.inject(1) { |product, n| product * n }
end
