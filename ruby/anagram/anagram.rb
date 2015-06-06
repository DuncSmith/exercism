class Anagram
  def initialize(match_word)
    @match_word = match_word
  end

  def match(words)
    remove_duplicates(
      find_matching_anagrams(
        group_anagrams(
          exclude_search_word(
            group_by_word(words)))))
  end

  private

  attr_reader :match_word

  def group_by_word(words)
    words.group_by(&:downcase)
  end

  def exclude_search_word(word_groups)
    word_groups.reject { |word, _| word == match_word.downcase }
  end

  def group_anagrams(word_groups)
    word_groups.group_by { |word, _| letters(word) }
  end

  def find_matching_anagrams(anagram_groups)
    anagram_groups[letters(match_word)] || []
  end

  def remove_duplicates(anagram_group)
    anagram_group.flat_map { |_, word_copies| word_copies.take(1) }
  end

  def letters(word)
    word.downcase.chars.sort
  end
end
