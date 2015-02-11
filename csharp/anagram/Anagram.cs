using System;
using System.Linq;

public class Anagram
{
  private readonly string _word;
  private readonly string _lettersInWord;

  public Anagram(string word)
  {
    _word = word.ToLower();
    _lettersInWord = LettersInWord(word);
  }

  public string[] Match(string[] words)
  {
    return words.Where(DifferentWord).Where(SameLetters).ToArray();
  }

  private bool DifferentWord(string word)
  {
    return !_word.Equals(word, StringComparison.InvariantCultureIgnoreCase);
  }

  private bool SameLetters(string word)
  {
    return _lettersInWord.Equals(LettersInWord(word));
  }

  private static string LettersInWord(string word)
  {
    return new string(word.ToLower().OrderBy(c => c).ToArray());
  }
}
