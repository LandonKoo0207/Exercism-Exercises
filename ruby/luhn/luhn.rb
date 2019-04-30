class Luhn
  attr_reader :number

  def initialize(number)
    @number = number.gsub(/\s+/,"")
  end

  def self.valid?(number)
    new(number).valid?
  end

  def valid?
    valid_luhn_format? && multiple_of_ten?(checksum)
  end

  def valid_luhn_format?
    @number.length > 1 && @number !~ /\D/
  end

  def checksum
    @number.reverse.each_char.each_slice(2).sum { |a, b| a.to_i + double(b) }
  end

  def double(digit)
    digit.to_i * 2 > 9 ? digit.to_i*2 - 9 : digit.to_i*2
  end

  def multiple_of_ten?(checksum)
    (checksum % 10).zero?
  end
end