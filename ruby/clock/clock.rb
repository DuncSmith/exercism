class Clock
  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = (hour + (minute / 60)) % 24
    @minute = minute % 60
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(other)
    Clock.new(hour, minute + other)
  end

  def -(other)
    Clock.new(hour, minute - other)
  end

  def ==(other)
    other.class == self.class && other.state == state
  end

  alias_method :eql?, :==

  def hash
    state.hash
  end

  protected

  def state
    [hour, minute]
  end

  private

  attr_reader :hour, :minute
end
