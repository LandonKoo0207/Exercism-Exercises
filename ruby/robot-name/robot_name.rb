class Robot

  LETTERS = [*'AA'..'ZZ']
  NUMBERS = [*'000'..'999']

  @@names = {}

  attr_reader :name

  def initialize
    @name = unique_name
    @@names[@name] = 1
  end

  def self.names
    @@names
  end

  def unique_name
    name = random_name
    while @@names[name]
      name = random_name
    end
    name
  end

  def random_name
    LETTERS.sample + NUMBERS.sample
  end

  def self.forget
    @@names = {}
  end

  def reset
    initialize
  end
end

module BookKeeping
  VERSION = 3
end