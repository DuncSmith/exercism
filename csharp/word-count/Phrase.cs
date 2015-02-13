using System;
using System.Collections.Generic;
using System.Linq;

public class Phrase
{
  private readonly string _text;

  public Phrase(string text)
  {
    _text = text;
  }

  public Dictionary<string, int> WordCount()
  {
    var wordChars = Enumerable.Range('a', 26)
      .Union(Enumerable.Range('A', 26))
      .Union(Enumerable.Range('0', 10))
      .Select(i => (char) i)
      .Concat(new[] {'\''});
    var allChars = Enumerable.Range('\0', 256).Select(i => (char) i);
    var nonWordChars = allChars.Except(wordChars);
    return _text
      .Split(nonWordChars.ToArray(), StringSplitOptions.RemoveEmptyEntries)
      .Select(w => w.Trim('\''))
      .Where(w => w != string.Empty)
      .GroupBy(w => w.ToLower())
      .ToDictionary(g => g.Key, g => g.Count());
  }
}
