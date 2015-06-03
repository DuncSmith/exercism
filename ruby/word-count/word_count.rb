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
    # prefer pre-defined method however it was added
    defined?(super) ? super : Hash[self]
  end
end
# included to_h will not replace any existing to_h instance method
# unless existing was also included from a module
Array.send :include, ArrayShim
