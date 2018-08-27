class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.downcase.scan(/\w+(?:'\w+)*/)
    words.each_with_object(Hash.new(0)) { |word, counts| counts[word] += 1 }
  end
end

module BookKeeping
  VERSION = 1
end