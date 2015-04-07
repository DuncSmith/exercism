class FoodChainSong
  def sing
    verses(1, 8)
  end

  def verses(from, to)
    format_lines((from..to).map { |number| verse(number) })
  end

  def verse(number)
    format_lines(opening(number), closing(number))
  end
  
  private
  
  def opening(number)
    lines = [first_line(things[number-1])]
    lines << second_line[number-2] unless number < 2
    lines
  end
  
  def closing(number)
    return [] if number == 8
    [
      things_in_verse(number).map { |things| reason_line(things) },
      last_line
    ]
  end
  
  def format_lines(*lines)
    lines.flatten.join("\n") + "\n"
  end
  
  def first_line(thing)
    "I know an old lady who swallowed a #{thing}."
  end
  
  def second_line
    [
      "It wriggled and jiggled and tickled inside her.",
      "How absurd to swallow a bird!",
      "Imagine that, to swallow a cat!",
      "What a hog, to swallow a dog!",
      "Just opened her throat and swallowed a goat!",
      "I don't know how she swallowed a cow!",
      "She's dead, of course!"
    ]
  end
  
  def things_in_verse(number)
    thing_pairs.drop(1 + thing_pairs.size - number)
  end

  def thing_pairs
    things.reverse.take(things.size - 1).zip(things.reverse.drop(1))
  end
  
  def things
    [
      "fly",
      "spider",
      "bird",
      "cat",
      "dog",
      "goat",
      "cow",
      "horse"
    ]
  end
  
  def reason_line(things)
    "She swallowed the #{things[0]} to catch the #{things[1]}" +
      (things[1] == 'spider' ?
        ' that wriggled and jiggled and tickled inside her' : '') + "."
  end

  def last_line
    "I don't know why she swallowed the fly. Perhaps she'll die."
  end
end
