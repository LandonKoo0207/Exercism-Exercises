class Hamming
  def self.compute(str1, str2)
    raise ArgumentError.new('The two DNA strands must be the same length') if str1.length != str2.length
    return 0 if str1 == str2
    str1.each_char.with_index.count { |dna, index| dna != str2[index] }
  end
end