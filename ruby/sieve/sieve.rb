class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2
    (2..@limit).select { |number| (2..number).count { |n| (number % n).zero? } == 1 }
  end
end

module BookKeeping
  VERSION = 1
end