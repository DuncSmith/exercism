using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class Phrase
{
  private readonly string _words;

  public Phrase(string words)
  {
    _words = words;
  }

  public Dictionary<string, int> WordCount()
  {
    return Regex.Split(_words, @"[^\w']")
      .Select(word => word.Trim('\'').ToLower())
      .Where(word => word != string.Empty)
      .GroupBy(word => word)
      .ToDictionary(group => group.Key, group => group.Count());
  }
}
