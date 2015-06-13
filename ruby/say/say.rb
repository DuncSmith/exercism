class Say
  def initialize(number)
    validate_input(number)
    @number = number
  end

  def in_english
    return 'zero' if number == 0
    big_part = 100 * (number / 100)
    small_part = number - big_part
    [
      say_big_number(big_part),
      say_small_number(small_part)
    ].compact.join(' ')
  end

  private

  attr_reader :number

  def validate_input(number)
    return if number >= 0 && number < 1_000_000_000_000
    fail(ArgumentError, 'Number out of bounds')
  end

  def say_big_number(number)
    words = []
    BIG_WORDS.each do |value, word|
      if (number >= value)
        multiplier = number / value
        words += [Say.new(multiplier).in_english, word]
        number -= multiplier * value
      end
      break if number == 0
    end
    words.any? ? words.join(' ') : nil
  end

  def say_small_number(number)
    words = []
    SMALL_WORDS.each do |value, word|
      if (number >= value)
        words << word
        number -= value
      end
      break if number == 0
    end
    words.any? ? words.join('-') : nil
  end

  BIG_WORDS =
    [
      [1_000_000_000, 'billion'],
      [1_000_000, 'million'],
      [1_000, 'thousand'],
      [100, 'hundred']
    ]

  SMALL_WORDS =
    [
      [90, 'ninety'],
      [80, 'eighty'],
      [70, 'seventy'],
      [60, 'sixty'],
      [50, 'fifty'],
      [40, 'forty'],
      [30, 'thirty'],
      [20, 'twenty'],
      [19, 'nineteen'],
      [18, 'eighteen'],
      [17, 'seventeen'],
      [16, 'sixteen'],
      [15, 'fifteen'],
      [14, 'fourteen'],
      [13, 'thirteen'],
      [12, 'twelve'],
      [11, 'eleven'],
      [10, 'ten'],
      [9, 'nine'],
      [8, 'eight'],
      [7, 'seven'],
      [6, 'six'],
      [5, 'five'],
      [4, 'four'],
      [3, 'three'],
      [2, 'two'],
      [1, 'one']
    ]

  private_constant :BIG_WORDS, :SMALL_WORDS
end
