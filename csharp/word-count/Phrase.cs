using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class Phrase
{
  private const string WordBoundary = @"[^\w']";
  private readonly string _text;

  public Phrase(string text)
  {
    _text = text;
  }

  public Dictionary<string, int> WordCount()
  {
    return Words.GroupBy(w => w).ToDictionary(g => g.Key, g => g.Count());
  }

  private IEnumerable<string> Words
  {
    get
    {
      return Regex.Split(_text, WordBoundary)
        .Select(CleanedAndNormalizedWord).Where(WordNotEmpty);
    }
  }

  private static string CleanedAndNormalizedWord(string word)
  {
    return word.Trim('\'').ToLower();
  }

  private static bool WordNotEmpty(string word)
  {
    return word != string.Empty;
  }
}
