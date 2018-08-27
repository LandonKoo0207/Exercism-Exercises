class Grains
  MAX_SQUARE = 64
  
  def self.square(square)
    case square
    when 1..MAX_SQUARE
      2**(square-1)
    else
      raise ArgumentError.new("The number of square must be between 1 and 64")
    end
  end

  def self.total
    2**MAX_SQUARE - 1
  end
end