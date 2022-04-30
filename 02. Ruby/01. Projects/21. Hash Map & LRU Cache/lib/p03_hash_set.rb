class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { [] }
    @count = 0
  end

  def insert(key)
    return if include?(key)

    key = key.hash
    self[key] << key
    @count += 1
    resize! if @count == num_buckets
  end

  def include?(num)
    num = num.hash
    self[num].include?(num)
  end

  def remove(key)
    return unless include?(key)

    key = key.hash
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    num = num.hash
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { [] }
    @count = 0
    old_store.flatten.each { |num| insert(num) }
  end
end
