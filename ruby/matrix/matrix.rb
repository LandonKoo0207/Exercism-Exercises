class Matrix
  def initialize(numbers)
    @numbers = numbers
  end

  def rows
    @numbers.split("\n").map { |row| row.split.map(&:to_i) }
  end

  def columns
    rows.first.map.with_index { |column, i| rows.map { |row| row[i] } }
  end

  def matrix(numbers)
    numbers.split("\n").map { |row| row.split.map(&:to_i) }
  end
end