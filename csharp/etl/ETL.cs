using System.Collections.Generic;
using System.Linq;

public class ETL
{
  public static
    Dictionary<string, int> Transform(Dictionary<int, IList<string>> old)
  {
    return LetterValuePairs(old)
      .ToDictionary(lvp => lvp.Key, lvp => lvp.Value);
  }

  private static IEnumerable<KeyValuePair<string, int>> LetterValuePairs(
    Dictionary<int, IList<string>> old)
  {
    return old.SelectMany(
      kvp => kvp.Value.Select(
        letter => new KeyValuePair<string, int>(letter.ToLower(), kvp.Key)));
  }
}
