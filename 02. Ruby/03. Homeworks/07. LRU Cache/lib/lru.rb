# frozen_string_literal: true

# Class that represents simple LRU cache.
class LRUCache
  attr_reader :cache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.size
  end

  def add(element)
    if @cache.include?(element)
      @cache.delete(element)
    elsif count >= @size
      @cache.shift
    end

    @cache << element
  end

  def show
    p @cache
  end
end
