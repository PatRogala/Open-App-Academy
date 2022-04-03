def proper_factors(number)
  factors = []
  (1..number / 2).each do |factor|
    factors << factor if (number % factor).zero?
  end
  factors
end

def aliquot_sum(number)
  proper_factors(number).sum
end

def perfect_number?(number)
  number == aliquot_sum(number)
end

def ideal_numbers(n)
  perfect_numbers = []
  i = 1
  while perfect_numbers.length < n
    perfect_numbers << i if perfect_number?(i)
    i += 1
  end
  perfect_numbers
end
