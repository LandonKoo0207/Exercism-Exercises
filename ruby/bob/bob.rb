class Bob
  def self.hey(remark)
    remark = remark.strip
    if self.shouting?(remark) && self.question?(remark)
      "Calm down, I know what I'm doing!"
    elsif self.shouting?(remark)
      "Whoa, chill out!"
    elsif self.question?(remark)
      "Sure."
    elsif remark.empty?
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  def self.shouting?(remark)
    remark == remark.upcase && remark != remark.downcase
  end

  def self.question?(remark)
    remark.end_with? '?'
  end
end

module BookKeeping
  VERSION = 2
end