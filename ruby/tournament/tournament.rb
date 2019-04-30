class Tournament

  RESULT_PAIRS = Hash[*%w{win loss loss win draw draw}]
  SCORES = { 'win' => 3, 'draw' => 1, 'loss' => 0 }
  COLUMNS = "%-30s | %2s | %2s | %2s | %2s | %2s"
  HEADER = "Team                           | MP |  W |  D |  L |  P\n"

  def self.tally(input)
    @tally = generate_tally(result_pairs(input))
    tally_to_str(@tally)
  end

  def self.generate_tally(result_pairs)
    result_pairs.map do |team, results|
      {
        'Team' => team,
        'MP'   => results.count,
        'W'    => results.count('win'),
        'D'    => results.count('draw'),
        'L'    => results.count('loss'),
        'P'    => results.sum(&SCORES)
      }
    end
  end

  def self.result_pairs(input)
    input.split("\n").each_with_object(Hash.new { |h, k| h[k] = [] }) do |match, roster|
      home, away, result = match.split(";")
      roster[home] << result
      roster[away] << RESULT_PAIRS[result]
    end
  end

  def self.sort_tally(tally)
    tally.sort_by { |result| [-result['P'], result['Team']] }
  end

  def self.tally_to_str(tally)
    sort_tally(tally).map(&:values)
      .unshift(tally.map { |e| e.keys }.flatten.uniq)
      .map(&COLUMNS.method(:%))
      .join("\n") + "\n"
  rescue ArgumentError => e
      HEADER
  end
end