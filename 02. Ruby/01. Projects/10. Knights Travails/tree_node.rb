# frozen_string_literal: true

# PolyTreeNode class
class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent&.children&.delete(self)
    @parent = node
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
    children << child_node unless children.include?(child_node)
  end

  def remove_child(child_node)
    raise 'Not a child' unless children.include?(child_node)

    child_node.parent = nil
    children.delete(child_node)
  end

  def dfs(target_value)
    return self if value == target_value

    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value

      current_node.children.each { |child| queue << child }
    end

    nil
  end
end
