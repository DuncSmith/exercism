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
      yield return Tuple.Create(CharAt(index, first), CharAt(index, second));
  }

  private static char CharAt(int index, string value)
  {
    return index < value.Length ? value[index] : '\0';
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
