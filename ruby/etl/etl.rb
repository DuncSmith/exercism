class ETL
  def self.transform(score_letter_hash)
    ETL.new(score_letter_hash).letter_score_hash
  end

  def initialize(score_letter_hash)
    @score_letter_hash = score_letter_hash
  end

  def letter_score_hash
    letter_score_pairs.reduce(:merge)
  end

  private

  attr_reader :score_letter_hash

  def letter_score_pairs
    score_letter_hash.map do |score, letters|
      Hash[letters.map {|letter| [letter.downcase, score]}]
    end
  end
end
