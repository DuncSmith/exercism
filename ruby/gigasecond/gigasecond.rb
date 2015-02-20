class Gigasecond
  OneGigasecond = 1e+9
  private_constant :OneGigasecond
  
  def self.from(birth_date)
    birth_date + OneGigasecond
  end  
end
