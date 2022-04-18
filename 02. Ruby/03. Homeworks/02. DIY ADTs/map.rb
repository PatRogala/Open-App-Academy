# frozen_string_literal: true

# class that represents Map
class Map
  def initialize
    @map = []
  end

  def set(key, value)
    if get(key)
      @map[key] = value
    else
      @map.push([key, value])
    end
  end

  def get(key)
    @map.each do |pair|
      return pair if pair[0] == key
    end
    nil
  end

  def delete(key)
    @map.delete get(key) if get(key)
  end

  def show
    @map
  end
end
