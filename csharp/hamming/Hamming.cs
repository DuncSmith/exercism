using System;
using System.Collections.Generic;

public class Hamming
{
  public static int Compute(string first, string second)
  {
    return CountMismatched(PositionalPairs(first, second));
  }

  private static IEnumerable<Tuple<char, char>> PositionalPairs(
    string first, string second)
  {
    for (var index = 0; index < first.Length; index++)
    {
      var firstNucleotide = first[index];
      var secondNucleotide = index < second.Length ? second[index] : '\0';
      yield return Tuple.Create(firstNucleotide, secondNucleotide);
    }
  }

  private static int CountMismatched(IEnumerable<Tuple<char, char>> pairs)
  {
    var count = 0;
    foreach (var pair in pairs)
      if (Mismatched(pair))
        count++;
    return count;
  }

  private static bool Mismatched(Tuple<char, char> pair)
  {
    return pair.Item1 != pair.Item2;
  }
}
