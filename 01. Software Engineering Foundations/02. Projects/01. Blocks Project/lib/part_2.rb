def all_words_capitalized?(array)
  array.all? { |word| word == word.capitalize }
end

def no_valid_url?(array)
  array.none? { |url| url.match?(/(.com|.net|.io|.org)$/) }
end

def any_passing_students?(array)
  array.any? { |student| student[:grades].sum / student[:grades].length >= 75 }
end
