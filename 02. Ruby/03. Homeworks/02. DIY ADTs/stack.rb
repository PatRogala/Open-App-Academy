# frozen_string_literal: true

# Class that respresents Stack
class Stack
  def initialize
    @stack = []
  end

  def push(ele)
    @stack << ele
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end
