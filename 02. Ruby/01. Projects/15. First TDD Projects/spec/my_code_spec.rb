# frozen_string_literal: true

require 'my_code'
require 'rspec'

describe '#my_uniq' do
  it 'returns an array of unique elements' do
    array = [1, 2, 1, 3, 3]
    expect(my_uniq(array)).to eq([1, 2, 3])
  end
end

describe '#two_sum' do
  it 'returns an array of pairs of positions where the elements at those positions sum to zero' do
    array = [-1, 0, 2, -2, 1]
    expect(two_sum(array)).to eq([[0, 4], [2, 3]])
  end
end

describe '#my_transpose' do
  it 'returns a transposed array' do
    array = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    expect(my_transpose(array)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end
