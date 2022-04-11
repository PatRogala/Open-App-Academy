# frozen_string_literal: true

# Class indicates a card in a deck
class Card
  attr_reader :revealed, :value

  def initialize(value)
    @value = value
    @revealed = false
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def to_s
    @revealed ? @value : ' '
  end

  def ==(other)
    @value == other.value
  end
end
