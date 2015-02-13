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
    var split = Regex.Split(_text, @"[^\w']+'+[^\w']+|[^\w']+");
    return split.Where(word => word != string.Empty)
      .GroupBy(word => word.ToLower())
      .ToDictionary(group => group.Key, group => group.Count());
  }
}
