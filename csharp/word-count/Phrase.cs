using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class Phrase
{
  private readonly string _text;

  public static Dictionary<string, int> WordCount(string text)
  {
    return new Phrase(text).CountWords();
  }

  public Phrase(string text)
  {
    _text = text;
  }

  public Dictionary<string, int> CountWords()
  {
    return WordPattern.Matches(_text).Cast<Match>()
      .Select(m => m.Value.ToLower())
      .GroupBy(word => word)
      .ToDictionary(g => g.Key, g => g.Count());
  }

  private static Regex WordPattern
  {
    get
    {
      return new Regex(
        @"     (?<= # A word is preceeded by:
                 ^| #  - start of string, or
                ^'| #  - apostrophe at start of string, or
            [^\w']| #  - any non-word character except apostrophe, or
               \W') #  - any non-word character and apostrophe.
                  ( # A word is:
                \w| #  - single word character, or
        \w[\w']*\w) #  - 2 or more word or apostrophe characters,
                    #    starting and ending with a word character
                (?= # A word is followed by:
               '\W| #  - an apostrophe and any non-word character, or
            [^\w']| #  - any non-word character except apostrophe, or
                '$| #  - apostrophe at end of string, or
                 $) #  - end of string
        ",
        RegexOptions.Compiled |
        RegexOptions.IgnorePatternWhitespace |
        RegexOptions.ExplicitCapture);
    }
  }
}
