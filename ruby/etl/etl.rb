class ETL
  def self.transform(source)
    source.flat_map do |score, letters|
      letters.map { |letter| [letter.downcase, score] }
    end.to_h
  end
end
