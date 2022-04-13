# frozen_string_literal: true

require 'set'

# class to find the shortest chain of words from one word to another
class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp).to_set
  end

  def adjacent_words(word)
    adjacent_words = []
    word.length.times do |i|
      ('a'..'z').each do |letter|
        new_word = word.dup
        new_word[i] = letter
        adjacent_words << new_word if @dictionary.include?(new_word)
      end
    end
    adjacent_words
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }
    until @current_words.empty?
      new_current_words = explore_current_words
      @current_words = new_current_words
      break if @current_words.include?(target)
    end
    build_path(target)
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        next if @all_seen_words.include?(adjacent_word)

        @all_seen_words[adjacent_word] = current_word
        new_current_words << adjacent_word
      end
    end
    new_current_words
  end

  def build_path(target)
    path = []
    current_word = target
    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end
    path.reverse
  end
end
