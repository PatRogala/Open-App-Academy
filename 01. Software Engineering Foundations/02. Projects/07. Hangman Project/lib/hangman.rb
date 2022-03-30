class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = %w[cat dog bootcamp pizza]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |c, i|
      indices << i if c == char
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end

    if get_matching_indices(char).empty?
      @remaining_incorrect_guesses -= 1
      @attempted_chars << char
      return false
    end

    @attempted_chars << char
    fill_indices(char, get_matching_indices(char))
    true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    char = gets.chomp
    try_guess(char)
  end

  def win?
    return false unless @guess_word.join('') == @secret_word

    print 'WIN'
    true
  end

  def lose?
    return false unless @remaining_incorrect_guesses == 0

    print 'LOSE'
    true
  end

  def game_over?
    return false unless win? || lose?

    print @secret_word
    true
  end
end
