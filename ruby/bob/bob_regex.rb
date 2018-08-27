class Bob
  def self.hey(remark)
    case remark
    when /^((?![a-z]+).)*([A-Z]+)([0-9]|[[:punct:]])*[^\?]$/
      "Whoa, chill out!"
    when /^((?![a-z]+).)*([A-Z]+)[\?]$/
      "Calm down, I know what I'm doing!"
    when /\?(\s|[[:punct]])*\z/
      "Sure."
    when /\s{#{remark.length}}/
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end
end

module BookKeeping
  VERSION = 2
end