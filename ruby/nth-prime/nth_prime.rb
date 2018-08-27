class Prime
  def self.nth(n)
    raise ArgumentError.new('There is no 0th prime. Please enter n larger than 0.') if n == 0

    prime_count = 0
    current_number = 2
    loop do
      prime_count += 1 if is_prime?(current_number)
      return current_number if prime_count == n
      current_number += 1
    end
  end

  def self.is_prime?(number)
    (2..number-1).none? { |num| number % num == 0 } && number >= 2
  end
end

module BookKeeping
  VERSION = 1
end