using System.Collections.Generic;

public class Hamming
{
  public static int Compute(string first, string second)
  {
    return CountMismatched(PositionalPairs(first, second));
  }

  private static IEnumerable<char[]> PositionalPairs(
    string first, string second)
  {
    for (var index = 0; index < first.Length; index++)
    {
      var firstNucleotide = first[index];
      var secondNucleotide = index < second.Length ? second[index] : '\0';
      yield return new[] {firstNucleotide, secondNucleotide};
    }
  }

  private static int CountMismatched(IEnumerable<char[]> pairs)
  {
    var count = 0;
    foreach (var pair in pairs)
      if (Mismatched(pair))
        count++;
    return count;
  }

  private static bool Mismatched(IList<char> pair)
  {
    return pair[0] != pair[1];
  }
}
