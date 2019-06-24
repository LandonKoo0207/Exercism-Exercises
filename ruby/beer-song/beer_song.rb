class BeerSong
  def self.recite(total, take)
    (0..take-1).each_with_object([]) { |current, song| song.push(verse(total-current, total, take)) }.join
  end

  def self.verse(number_of_beers, total, take)
    first_phrase(number_of_beers) + second_phrase(number_of_beers) + \
    extra_new_line(total, take, number_of_beers)
  end

  def self.extra_new_line(total, take, number_of_beers)
    (total - number_of_beers < take - 1 ? "\n" : "")
  end

  def self.bottle_or_bottles(number_of_beers)
    return "bottle" if number_of_beers == 1
    "bottles"
  end

  def self.number_of_beers(number_of_beers)
    return "no more" if number_of_beers == 0
    number_of_beers
  end

  def self.first_phrase(number_of_beers)
    "#{number_of_beers(number_of_beers).to_s.capitalize} " + \
    "#{bottle_or_bottles(number_of_beers)} of beer on the wall, " + \
    "#{number_of_beers(number_of_beers)} #{bottle_or_bottles(number_of_beers)} of beer.\n"
  end

  def self.second_phrase(number_of_beers)
    return "Go to the store and buy some more, 99 bottles of beer on the wall.\n" if number_of_beers == 0

    it_or_one = number_of_beers - 1 == 0 ? "it" : "one"

    "Take " + it_or_one + " down and pass it around, #{number_of_beers(number_of_beers-1)} " + \
    "#{bottle_or_bottles(number_of_beers-1)} of beer on the wall.\n"
  end
end