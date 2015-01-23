class Numeric
  def seconds
    return Rational(self, 86400)
  end
end

class Gigasecond
  Gigasecond = 1e+9.seconds
  private_constant :Gigasecond
  
  def self.from(birth_date)
    (birth_date.to_datetime + Gigasecond).to_date
  end  
end
