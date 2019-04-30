class Series
  def initialize(digits)
    @input_str = digits
  end

  def slices(digit)
    raise ArgumentError.new('The length of a series cannot be larger than the original string') if @input_str.length < digit

    @input_str.each_char.each_cons(digit).map { |arr| arr.join }
  end
end