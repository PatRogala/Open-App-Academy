# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  new_str = ''
  str.gsub(/(.)\1*/).to_a.each do |char|
    new_str << char.length.to_s + char[0] if char.length > 1
    new_str << char if char.length == 1
  end

  new_str
end

p compress_str('aaabbc')        # => "3a2bc"
p compress_str('xxyyyyzz')      # => "2x4y2z"
p compress_str('qqqqq')         # => "5q"
p compress_str('mississippi')   # => "mi2si2si2pi"
