class Sentence
  def initialize(words)
    @words = words
  end

  def self.of(words)
    Sentence.new(words)
  end

  def shouted?
    not_just_numbers? && upper_case?
  end

  def question?
    words.end_with? '?'
  end

  def silent?
    words.strip.empty?
  end

  private

  attr_reader :words

  def not_just_numbers?
    words =~ /[A-Za-z]/
  end

  def upper_case?
    words == words.upcase
  end
end

class Bob
  def hey(something)
    Response.to(Sentence.of(something)).say
  end

  private

  class Response
    def initialize(sentence)
      @sentence = sentence
    end

    def self.to(sentence)
      Response.new(sentence)
    end

    def say
      if sentence.shouted?
        'Woah, chill out!'
      elsif sentence.question?
        'Sure.'
      elsif sentence.silent?
        'Fine. Be that way!'
      else
        'Whatever.'
      end
    end

    private

    attr_reader :sentence
  end
end
