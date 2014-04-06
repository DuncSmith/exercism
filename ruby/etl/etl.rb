class ETL
  def self.transform(scoresToLettersMap)
    letterScorePairs = scoresToLettersMap.map do |score, letters|
      Hash[letters.map {|letter| [letter.downcase, score]}]
    end
    letterScorePairs.reduce(:merge)
  end
end
