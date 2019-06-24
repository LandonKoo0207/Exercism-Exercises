class ETL
  def self.transform(old)
    old.map.with_object({}) { |pair, h| pair[1].map { |e| h[e.downcase] = pair[0] } }
  end
end