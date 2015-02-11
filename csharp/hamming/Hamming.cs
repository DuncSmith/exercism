using System;
using System.Collections.Generic;
using System.Linq;

public class Hamming
{
  public static int Compute(string first, string second)
  {
    return PositionalPairs(first, second).Count(Mismatched);
  }

  private static IEnumerable<Tuple<char, char>> PositionalPairs(
    string first, string second)
  {
    return first.Zip(second, Tuple.Create);
  }

  private static bool Mismatched(Tuple<char, char> pair)
  {
    return pair.Item1 != pair.Item2;
  }
}
