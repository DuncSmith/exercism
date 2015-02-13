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
    return Regex.Split(_text, @"\W")
      .Where(word => word != string.Empty)
      .GroupBy(word => word.ToLower())
      .ToDictionary(group => group.Key, group => group.Count());
  }
}
