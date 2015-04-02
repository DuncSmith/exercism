class Acronym
  def self.abbreviate(phrase)
    Acronym.new(phrase).abbreviation
  end

  def abbreviation
    component_words.map { |word| word.chars.first.upcase }.join('')
  end

  private

  def initialize(phrase)
    @phrase = phrase
  end

  def component_words
    words.map(&method(:decompose_word)).flatten
  end

  def words
    @phrase.split(' ')
  end

  def decompose_word(word)
    decomposed = word.scan(/[A-Z][a-z]+/)
    decomposed.empty? ? word.split('-') : decomposed
  end
end
