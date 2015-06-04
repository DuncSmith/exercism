class Series
  def initialize(series)
    @series = series
  end

  def slices(length)
    fail(ArgumentError, 'Length too long') if length > digits.size
    (0..digits.size - length).map { |start| digits[start, length] }
  end

  private

  attr_reader :series

  def digits
    @digits ||= series.chars.map(&:to_i)
  end
end
