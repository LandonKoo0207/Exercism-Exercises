class Complement
  def self.of_dna(str)
    return "" if str.match?(/[^GCTA]/)
    str.tr('GCTA', 'CGAU')
  end
end

module BookKeeping
  VERSION = 4
end