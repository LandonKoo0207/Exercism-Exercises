class Series
  def initialize(string)
    @input_str = string
  end

  def slices(digit)
    raise ArgumentError.new('The length of a series cannot be larger than the original string') if @input_str.length < digit
    @input_str.each_char.with_object([]) { |c, series| series << @input_str[@input_str.index(c)..@input_str.index(c)+(digit-1)] \
                                        if @input_str.index(c) + (digit-1) <= @input_str.length-1  }.uniq
  end
end