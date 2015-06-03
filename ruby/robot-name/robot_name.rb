class Robot
  def name
    @name ||= generate_name
  end

  def reset
    @name = nil
  end

  private

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
