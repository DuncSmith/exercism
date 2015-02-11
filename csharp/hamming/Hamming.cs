using System;
using System.Linq;

public class Hamming
{
  public static int Compute(string first, string second)
  {
    return first.Zip(second, Tuple.Create).Count(x => x.Item1 != x.Item2);
  }
}
