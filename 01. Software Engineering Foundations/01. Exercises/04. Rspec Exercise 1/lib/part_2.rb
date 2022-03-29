def hipsterfy(word)
  vowels = 'aeiou'
  idx = word.length - 1
  while idx >= 0
    return word[0...idx] + word[idx + 1..-1] if vowels.include?(word[idx])

    idx -= 1
  end
  word
end

def vowel_counts(string)
  vowels = 'aeiou'
  counts = Hash.new(0)
  string.each_char do |char|
    counts[char.downcase] += 1 if vowels.include?(char.downcase)
  end
  counts
end

def caesar_cipher(message, key)
  alphabet = ('a'..'z').to_a
  message.each_char.with_index do |char, idx|
    if alphabet.include?(char.downcase)
      new_idx = (alphabet.index(char.downcase) + key) % 26
      message[idx] = alphabet[new_idx]
    end
  end
  message
end
