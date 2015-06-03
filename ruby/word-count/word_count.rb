class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    text
      .split(/[^\w']+/)
      .group_by(&:downcase)
      .map { |w, g| [w, g.size] }
      .to_h
  end

  private

  attr_reader :text
end

# Crude patch to add to_h for Ruby version < 2.1
module ArrayShim
  def to_h
    Hash[self]
  end
end
# included to_h lower precedence so prefers any existing instance method
Array.send :include, ArrayShim
