using System.Linq;

public class Hamming
{
  public static int Compute(string first, string second)
  {
    return first.Zip(second, (f, s) => f == s ? 0 : 1).Sum(x => x);
  }
}
