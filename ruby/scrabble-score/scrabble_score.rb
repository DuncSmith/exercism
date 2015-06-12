class Scrabble
  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word || ''
  end

  def score
    word.chars.map { |l| letter_scores[l.upcase] || 0 }.reduce(0, :+)
  end

  private

  attr_reader :word

  def letter_scores
    @letter_scores ||= [
      [1, %w(A E I O U L N R S T)],
      [2, %w(D G)],
      [3, %w(B C M P)],
      [4, %w(F H V W Y)],
      [5, %w(K)],
      [8, %w(J X)],
      [10, %w(Q Z)]
    ].flat_map { |score, letters| letters.map { |l| [l, score] } }.to_h
  end
end
