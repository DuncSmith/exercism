using System.Collections.Generic;
using System.Linq;

public class ETL
{
  public static
    Dictionary<string, int> Transform(Dictionary<int, IList<string>> old)
  {
    return LetterValuePairs(old)
      .ToDictionary(lvp => (string)lvp.Letter, lvp => (int)lvp.Value);
  }

  private static IEnumerable<dynamic> LetterValuePairs(
    Dictionary<int, IList<string>> old)
  {
    return old.SelectMany(
      kvp => kvp.Value.Select(
        letter => new {Letter = letter.ToLower(), Value = kvp.Key}));
  }
}
