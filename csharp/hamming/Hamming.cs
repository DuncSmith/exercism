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
      yield return new char[] {CharAt(first, index), CharAt(second, index)};
  }

  private static char CharAt(string value, int index)
  {
    return index < value.Length ? value[index] : '\0';
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
