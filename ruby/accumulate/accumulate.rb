class Array
  def accumulate(&block)
    return self if self.empty?

    self.map(&block)
  end
end

module BookKeeping
  VERSION = 1
end