class Robot
  attr_reader :name
  
  def initialize
    reset
  end

  def reset
    self.name = generate_name
  end

  private

  attr_writer :name

  def generate_name
    (letters.sample(2) + digits.sample(3)).join
  end

  def letters
    ('A'..'Z').to_a
  end

  def digits
    ('0'..'9').to_a
  end
end
