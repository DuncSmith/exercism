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
    for (int index = 0; index < first.Length; index++)
    {
      char firstNucleotide = first[index];
      char secondNucleotide = index < second.Length ? second[index] : '\0';
      yield return new char[] {firstNucleotide, secondNucleotide};
    }
  }

  private static int CountMismatched(IEnumerable<char[]> pairs)
  {
    int count = 0;
    foreach (char[] pair in pairs)
      if (Mismatched(pair))
        count++;
    return count;
  }

  private static bool Mismatched(IList<char> pair)
  {
    return pair[0] != pair[1];
  }
}
