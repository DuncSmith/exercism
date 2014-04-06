class ETL
  def self.transform(scoreToLettersMap)
    scores = scoreToLettersMap.keys
    letterScorePairs = scores.map do |score|
      letters = scoreToLettersMap[score]
      Hash[letters.map {|letter| [letter.downcase, score]}]
    end
    letterScorePairs.reduce(:merge)
  end
end
