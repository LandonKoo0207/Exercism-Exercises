class Game
  attr_reader :frames

  class BowlingError < StandardError; end

  def initialize
    @frames = []
  end

  def roll(pins)
    raise BowlingError.new unless valid_new_roll?(pins)
    new_frame?(frames) ? frames.push([pins]) : frames.last.push(pins)
  end

  def valid_new_roll?(pins)
    pins.between?(0, 10) && frame_sum_valid?(pins)
  end

  def frame_sum_valid?(pins)
    frames.empty? || \
    new_frame?(frames) || \
    ((regular_frame_sum_valid?(frames.last, pins) || tenth_frame_sum_valid?(frames.last, pins)))
  end

  def new_frame?(frames)
    frames.count < 10 && (frames.empty? || frames.last.sum == 10 || frames.last.count == 2)
  end

  def regular_frame_sum_valid?(frame, pins)
    frames.count <= 9 && frame.first + pins <= 10
  end

  def tenth_frame_sum_valid?(frame, pins)
    (frame.count == 1 && (frame.first == 10 || frame.first + pins <= 10)) || \
    (frame.count == 2 && frame.sum >= 10 && \
      (frame.sum % 10 == 0 || frame.last + pins <= 10))
  end

  def score
    raise BowlingError.new unless tenth_frame_complete?(frames.last)
    frames.map.with_index.sum { |frame, i| frame_score(frame, i) }
  end

  def tenth_frame_complete?(frame)
    frames.count == 10 && \
      (frame.count == 3 || (frame.count == 2 && frame.sum < 10))
  end

  def frame_score(frame, index)
    return frame.sum if index == 9

    if frame_category(frame) == "STRIKE"
      strike_frame_score(frame, index)
    elsif frame_category(frame) == "SPARE"
      spare_frame_score(frame, index)
    elsif frame_category(frame) == "OPEN"
      open_frame_score(frame)
    end
  end

  def frame_category(frame)
    frame.include?(10) ? "STRIKE" : (frame.sum == 10 ? "SPARE" : "OPEN")
  end

  def strike_frame_score(frame, index)
    frame[0] + frames[index+1..].flatten[0..1].sum
  end

  def spare_frame_score(frame, index)
    frame.sum + frames[index+1][0]
  end

  def open_frame_score(frame)
    frame.sum
  end
end