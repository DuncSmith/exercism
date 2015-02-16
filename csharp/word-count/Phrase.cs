using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class Phrase
{
  private readonly string _text;

  public Phrase(string text)
  {
    _text = text;
  }

  public Dictionary<string, int> WordCount()
  {
    return WordBoundary.Split(_text)
      .Select(WithoutApostrophesAtEnds)
      .Where(WordNotEmpty)
      .GroupBy(LowerCaseWord)
      .ToDictionary(GroupWord, GroupCount);
  }

  private static Regex WordBoundary
  {
    get
    {
      return new Regex(@"[^\w']", RegexOptions.Compiled);
    }
  }

  private static string WithoutApostrophesAtEnds(string word)
  {
    return word.Trim('\'');
  }

  private static bool WordNotEmpty(string word)
  {
    return word != string.Empty;
  }

  private static string LowerCaseWord(string word)
  {
    return word.ToLower();
  }

  private static string GroupWord(IGrouping<string, string> grouping)
  {
    return grouping.Key;
  }

  private static int GroupCount(IGrouping<string, string> grouping)
  {
    return grouping.Count();
  }
}
