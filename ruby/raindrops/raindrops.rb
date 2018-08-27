class Raindrops
  def self.convert(num_of_drops)
    raindrop_speak = ""
    raindrop_speak += 'Pling' if num_of_drops % 3 == 0
    raindrop_speak += 'Plang' if num_of_drops % 5 == 0
    raindrop_speak += 'Plong' if num_of_drops % 7 == 0

    raindrop_speak.empty? ? num_of_drops.to_s : raindrop_speak
  end
end

module BookKeeping
  VERSION = 3
end