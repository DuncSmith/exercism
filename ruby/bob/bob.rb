class Sentence
  def initialize(the_words)
    @the_words = the_words
  end

  def self.of(the_words)
    Sentence.new(the_words)
  end

  def is_shouted?
    is_something_other_than_numbers? and is_all_upper_case?
  end

  def is_a_question?
    the_words.end_with? '?'
  end

  def is_silent?
    the_words.strip.empty?
  end

  private

  attr_reader :the_words

  def is_something_other_than_numbers?
    the_words =~ /[A-Za-z]/
  end

  def is_all_upper_case?
    the_words == the_words.upcase
  end
end

class Response
  def initialize(sentence_in_response_to)
    @sentence = sentence_in_response_to
  end

  def self.to(sentence)
    Response.new(sentence)
  end

  def say
    return 'Woah, chill out!' if sentence.is_shouted?
    return 'Sure.' if sentence.is_a_question?
    return 'Fine. Be that way!' if sentence.is_silent?
    'Whatever.'
  end

  private

  attr_reader :sentence
end

class Bob
  def hey(something)
    Response.to(Sentence.of(something)).say
  end
end
