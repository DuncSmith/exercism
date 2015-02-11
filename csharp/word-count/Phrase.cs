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
    return Regex.Matches(_words, @"(?:\w[\w']*|[\w']*\w)").Cast<Match>()
      .SelectMany(m => m.Groups.Cast<Group>())
      .SelectMany(g => g.Captures.Cast<Capture>())
      .Select(c => c.Value.ToLower())
      .GroupBy(word => word)
      .ToDictionary(group => group.Key, group => group.Count());
  }
}
