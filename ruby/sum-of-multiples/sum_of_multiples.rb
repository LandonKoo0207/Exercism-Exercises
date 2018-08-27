class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(upper_limit)
    all_multiples(upper_limit).sum
  end

  def all_multiples(upper_limit)
    (1..upper_limit-1).select { |number| @factors.any? { |factor| factor.is_factor_of?(number) } }
  end
end

class Integer
  def is_factor_of?(number)
    number.modulo(self).zero?
  end
end

module BookKeeping
  VERSION = 2
end