def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array(array)
  array.sum / array.length.to_f
end

def repeat(string, times)
  string * times
end

def yell(string)
  "#{string.upcase}!"
end

def alternating_case(string)
  string.split.map.with_index do |word, index|
    index.even? ? word.upcase : word.downcase
  end.join(' ')
end
