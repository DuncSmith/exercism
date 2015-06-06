class SpaceAge
  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  private

  def method_missing(symbol)
    name = symbol.to_s
    super unless name.start_with?('on_')
    planet = name[3..-1].to_sym
    year_length(planet) || super
  end

  def year_length(planet)
    return unless year_lengths.key?(planet)
    seconds / year_lengths[planet]
  end

  def year_lengths
    {
      mercury: 7_600_543.81992,
      venus: 19_414_149.052176,
      earth: 31_557_600.0,
      mars: 59_354_032.69008,
      jupiter: 374_355_659.124,
      saturn: 929_292_362.8848,
      uranus: 2_651_370_019.3296,
      neptune: 5_200_418_560.032
    }
  end
end
