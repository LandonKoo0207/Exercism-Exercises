class PhoneNumber
  def self.clean(phone_number)
    valid?(digits(phone_number)) ? last_ten_digits(digits(phone_number)) : nil
  end

  def self.digits(string)
    string.scan(/\d/).join
  end

  def self.valid?(digits)
    length_valid?(digits) && country_code_valid?(digits) && area_code_valid?(digits) && \
      exchange_code_valid?(digits)
  end

  def self.length_valid?(digits)
    digits.length >= 10
  end

  def self.last_ten_digits(digits)
    digits.slice(-10..)
  end

  def self.area_code_valid?(digits)
    last_ten_digits(digits)[0].to_i > 1
  end

  def self.exchange_code_valid?(digits)
    last_ten_digits(digits)[3].to_i > 1
  end

  def self.country_code_valid?(digits)
    digits.length == 11 ? digits[0].to_i == 1 : true
  end
end