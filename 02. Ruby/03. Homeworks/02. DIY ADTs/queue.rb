# frozen_string_literal: true

# Class that represents Queue
class Queue
  def initialize
    @queue = []
  end

  def enqueue(ele)
    @queue << ele
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end
