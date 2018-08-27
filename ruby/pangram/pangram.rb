class Pangram
  def self.pangram?(sentence)
    return false if sentence.empty?
    sentence.match?(/[[:ascii:]]{#{sentence.length}}/) &&
      sentence.downcase.scan(/[a-z]/).uniq.sort == ('a'..'z').to_a
  end
end

module BookKeeping
  VERSION = 6
end