class Robot
  def name
    @name ||= unique_name
  end

  def reset
    @name = nil
  end

  private

  def unique_name
    rnd_char_sequence([letter, 2], [digit, 3])
  end

  def rnd_char_sequence(*specs)
    specs.reduce('') do |sequence, spec|
      sequence + rnd_sequence_of_range(spec[0], spec[1])
    end
  end

  def rnd_sequence_of_range(range, count)
    (1..count).reduce('') do |sequence, _|
      sequence + range.to_a[rand(range.count)]
    end
  end

  def letter
    ('A'..'Z')
  end

  def digit
    ('0'..'9')
  end
end
