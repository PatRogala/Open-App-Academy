require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      node = @map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  def to_s
    "Map: #{@map}\nStore: #{@store}"
  end

  private

  def calc!(key)
    val = @prc.call(key)
    new_node = @store.append(key, val)
    @map[key] = new_node

    eject! if count > @max
    val
  end

  def update_node!(node)
    node.remove
    @map[node.key] = @store.append(node.key, node.val)
  end

  def eject!
    node = @store.first
    @store.remove(node.key)
    @map.delete(node.key)
  end
end
