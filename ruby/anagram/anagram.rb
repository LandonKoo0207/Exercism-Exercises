class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(@word, word) }
  end

  def anagram?(input_word, word_in_array)
    input_word.downcase != word_in_array.downcase && \
      sort_characters(input_word) == sort_characters(word_in_array)
  end

  def sort_characters(word)
    word.downcase.split("").sort
  end
end