class FoodChainSong
  def sing
    verses(1, 8)
  end

  def verses(from, to)
    (from..to).map { |number| verse(number) + "\n" }.join
  end

  def verse(number)
    Verse.new(number).to_s
  end

  class Verse
    def initialize(number)
      @number = number
    end

    def to_s
      [first_line, second_line, reason_lines, last_line].join
    end

    private

    attr_reader :number

    def first_line
      "I know an old lady who swallowed a #{THING[number]}.\n"
    end

    def second_line
      [
        '',
        "It wriggled and jiggled and tickled inside her.\n",
        "How absurd to swallow a bird!\n",
        "Imagine that, to swallow a cat!\n",
        "What a hog, to swallow a dog!\n",
        "Just opened her throat and swallowed a goat!\n",
        "I don't know how she swallowed a cow!\n",
        "She's dead, of course!\n"
      ][number - 1]
    end

    def reason_lines
      return if last_verse?
      number.downto(2).reduce([]) { |a, e| a + reason_line(e) }
    end

    def reason_line(n)
      [
        "She swallowed the #{THING[n]} to catch the #{THING[n - 1]}",
        if THING[n - 1] == 'spider'
          ' that wriggled and jiggled and tickled inside her'
        end,
        ".\n"
      ]
    end

    def last_line
      return if last_verse?
      "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    end

    def last_verse?
      number == THING.size - 1
    end

    THING =
      [
        '',
        'fly',
        'spider',
        'bird',
        'cat',
        'dog',
        'goat',
        'cow',
        'horse'
      ]

    private_constant :THING
  end

  private_constant :Verse
end
