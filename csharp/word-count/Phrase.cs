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
    var partialPhrases = new List<string>();
    var partPhrase = _words;
    Match match;
    do
    {
      match = Regex.Match(
        partPhrase, 
        @"(^.*?)(?:^|\s)'(\w|\w.*\w)'(?:\s|$)(.*?$)");
      if (match.Success)
      {
        if (match.Result("$1").Trim() != string.Empty)
          partialPhrases.Add(match.Result("$1"));
        if (match.Result("$1").Trim() != string.Empty)
          partialPhrases.Add(match.Result("$2"));
        partPhrase = match.Result("$3").Trim();
      }
      else
      {
        partialPhrases.Add(partPhrase);
      }
    } while (match.Success && partPhrase != string.Empty);

    var wordMatches = partialPhrases.SelectMany(
      paritalPhrase => 
        Regex.Matches(paritalPhrase, @"(?:\w[\w']*|[\w']*\w)").Cast<Match>());
    var wordMatchGroups = wordMatches.SelectMany(m => m.Groups.Cast<Group>());
    var wordCaptures = 
      wordMatchGroups.SelectMany(g => g.Captures.Cast<Capture>());
    var words = wordCaptures.Select(c => c.Value.ToLower());
    var wordGroups = words.GroupBy(word => word);
    return wordGroups.ToDictionary(group => group.Key, group => group.Count());
  }
}
