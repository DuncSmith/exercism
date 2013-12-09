class Year
  def initialize(number)
    @number = number
  end

  def leap?
    (number % 400 == 0) || ((number % 100) != 0 && (number % 4) == 0)
  end

  private

  attr_reader :number
end
