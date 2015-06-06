class BeerSong
  def verse(number)
    (number == 0 ? BeerSongFinale.new : BeerSongVerse.new(number)).to_s
  end

  def verses(from, to)
    from.downto(to).map { |n| verse(n) + "\n" }.join
  end

  def sing
    verses(99, 0)
  end
end

class BeerSongVerse
  def initialize(number)
    @number = number
  end

  def to_s
    first_line + second_line
  end

  private

  attr_reader :number

  def first_line
    "#{bottles} of beer on the wall, #{bottles} of beer.\n"
  end

  def second_line
    "Take #{a_bottle} down and pass it around, " \
      "#{bottles_left} of beer on the wall.\n"
  end

  def bottles
    "#{number} #{bottle_word(number)}"
  end

  def a_bottle
    number == 1 ? 'it' : 'one'
  end

  def bottles_left
    "#{number == 1 ? 'no more' : number - 1} #{bottle_word(number - 1)}"
  end

  def bottle_word(n)
    "bottle#{n == 1 ? '' : 's'}"
  end
end

class BeerSongFinale
  def to_s
    'No more bottles of beer on the wall, ' \
    "no more bottles of beer.\n" \
    'Go to the store and buy some more, ' \
    "99 bottles of beer on the wall.\n"
  end
end
