class Isogram
  def self.isogram?(word)
    Isogram.word_in_capital(word) == Isogram.word_in_capital(word).uniq
  end

  def self.word_in_capital(word)
    word.upcase.scan(/[A-Z]/)
  end
end