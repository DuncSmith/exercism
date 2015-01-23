class Gigasecond
  Gigasecond = Rational(1e+9, 86400)
  private_constant :Gigasecond
  
  def self.from(birth_date)
    (birth_date.to_datetime + Gigasecond).to_date
  end  
end
