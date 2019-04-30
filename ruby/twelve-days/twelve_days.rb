class TwelveDays
  DAYS = [ 'first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth',
           'ninth', 'tenth', 'eleventh', 'twelfth' ]
  PRESENTS = ['a Partridge in a Pear Tree', 'two Turtle Doves', 'three French Hens',
              'four Calling Birds', 'five Gold Rings', 'six Geese-a-Laying',
              'seven Swans-a-Swimming', 'eight Maids-a-Milking', 'nine Ladies Dancing',
              'ten Lords-a-Leaping', 'eleven Pipers Piping', 'twelve Drummers Drumming']

  def self.song
    (0...DAYS.length).map { |day| verse(day) }.join("\n")
  end

  def self.verse(day)
    "On the #{DAYS[day]} day of Christmas my true love gave to me: #{to_series(presents(day))}.\n"
  end

  def self.presents(day)
    PRESENTS.take(day+1)
  end

  def self.to_series(presents)
    *rest, last = presents.reverse
    rest.empty? ? last : rest.join(", ") + ", and " + last
  end
end