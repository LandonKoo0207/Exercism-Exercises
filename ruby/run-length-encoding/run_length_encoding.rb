class RunLengthEncoding
  def self.encode(letters)
    return '' if letters.empty?
    encode_regex = ""
    letters.each_char.uniq.each { |letter| encode_regex += letter + '+' \
                                  + (letter == letters.each_char.uniq.last ? "" : '|') }
    encoded = ""
    letters.scan(/#{encode_regex}/).each { |l| encoded += (l.length == 1 ? "" : l.length.to_s) + l[0] }
    encoded
  end

  def self.decode(letters)
    return letters if letters.empty? || !letters.match?(/[0-9]/)
    
    decoded = ""
    letters.scan(/[0-9]*[A-Za-z\s]/).each \
      { |l| decoded += l.length > 1 ? l[-1] * l.match(/[0-9]+/)[0].to_i : l  }

    decoded
  end
end

module BookKeeping
  VERSION = 3
end