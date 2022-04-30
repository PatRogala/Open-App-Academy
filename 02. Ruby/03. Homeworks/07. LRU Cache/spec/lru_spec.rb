# frozen_string_literal: true

require 'lru'

describe LRUCache do
  subject(:lru) { LRUCache.new(4) }

  it 'should not raise an error when initialized' do
    expect { lru }.to_not raise_error
  end

  describe '#add' do
    it 'should add a new element to cache' do
      lru.add('a')
      expect(lru.cache).to eq(['a'])
    end

    it 'should shift the oldest element to the end of the cache' do
      lru.add([1, 2, 3])
      lru.add(5)
      lru.add(-5)
      lru.add({ a: 1, b: 2, c: 3 })
      lru.add([1, 2, 3, 4])
      lru.add('I walk the line')
      lru.add(:ring_of_fire)
      lru.add('I walk the line')
      lru.add({ a: 1, b: 2, c: 3 })

      expect(lru.cache).to eq([[1, 2, 3, 4], :ring_of_fire, 'I walk the line', { a: 1, b: 2, c: 3 }])
    end
  end

  describe '#count' do
    it 'should return the number of elements in cache' do
      lru.add('I walk the line')
      lru.add(5)
      expect(lru.count).to eq(2)
    end
  end

  describe '#show' do
    it 'should print the cache' do
      lru.add('a')
      lru.add('b')
      expect { lru.show }.to output("[\"a\", \"b\"]\n").to_stdout
    end
  end
end
