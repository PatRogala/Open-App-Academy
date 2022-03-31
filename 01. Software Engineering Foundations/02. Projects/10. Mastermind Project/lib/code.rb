class Code
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }.freeze

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.include?(peg.upcase) }
  end

  def self.random(length)
    new(Array.new(length) { POSSIBLE_PEGS.keys.sample })
  end

  def self.from_string(pegs)
    new(pegs.chars)
  end

  def initialize(pegs)
    raise 'invalid pegs' unless Code.valid_pegs?(pegs)

    @pegs = pegs.map(&:upcase)
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def num_exact_matches(code)
    code.pegs.each_with_index.count { |peg, index| peg == pegs[index] }
  end

  def num_near_matches(guess)
    arr1 = []
    arr2 = []

    guess.pegs.each_with_index do |peg, index|
      next unless peg != @pegs[index]

      arr1 << guess[index]
      arr2 << @pegs[index]
    end
    arr1.uniq.count { |ele| arr2.include?(ele) }
  end

  def ==(other)
    pegs == other.pegs
  end
end
