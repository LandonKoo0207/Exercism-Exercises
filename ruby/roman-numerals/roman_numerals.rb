class Integer
  def to_roman
    edges = { 1000 => 'M', 990 =>  'XM', 900 =>  'CM', 500 =>  'D', 400 => 'CD', 100 =>  'C', 90 =>  'XC', \
                50 => 'L',  40 =>  'XL',  10 =>  'X',    9 =>  'IX',  5 =>  'V',  4 =>  'IV', 1 =>  'I'}
    num = self
    roman_numeral = ""
    while num >= 1
      edge = edges.find { |edge, roman| num / edge > 0 }
      roman_numeral += edge[1]
      num -= edge[0]
    end

    roman_numeral
  end
end

module BookKeeping
  VERSION = 2
end