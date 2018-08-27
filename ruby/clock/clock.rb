class Clock
  def initialize(hour_minute)
    @hour, @minute = hour_minute
  end

  def self.at(hour, minute)
    Clock.new(Clock.convert_to_hour_minute_array(hour, minute))
  end

  def +(minutes)
    Clock.new(Clock.convert_to_hour_minute_array(@hour, @minute+minutes))
  end

  def ==(clock)
    self.to_s == clock.to_s
  end

  def to_s
    Time.new(Time.now.year, Time.now.month, Time.now.day, @hour, @minute).strftime "%H:%M"
  end

  private

  def self.convert_to_hour_minute_array(hour, minute)
    [(hour + minute/60) % 24, minute % 60]
  end
end

module BookKeeping
  VERSION = 2
end