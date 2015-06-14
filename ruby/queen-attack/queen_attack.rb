class Queens
  attr_reader :white, :black

  def initialize(positions = nil)
    (positions || DEFAULT_POSITIONS).each do |queen, position|
      send("#{queen}=", position)
    end
    validate_state
  end

  def to_s
    markers = { white => 'W', black => 'B' }
    (0..7).map do |x|
      (0..7).map { |y| markers[[x, y]] || '_' }.join(' ')
    end.join("\n")
  end

  def attack?
    same_row? || same_column? || diagonal?
  end

  private

  attr_writer :white, :black

  DEFAULT_POSITIONS = { white: [0, 3], black: [7, 3] }

  private_constant :DEFAULT_POSITIONS

  def validate_state
    return unless white == black
    fail(ArgumentError, 'Queens can''t occupy the same space')
  end

  def same_row?
    delta[:y] == 0
  end

  def same_column?
    delta[:x] == 0
  end

  def diagonal?
    delta[:x] == delta[:y]
  end

  def delta
    [:x, :y].zip([0, 1].map { |i| (white[i] - black[i]).abs }).to_h
  end
end
