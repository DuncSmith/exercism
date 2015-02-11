using System.Linq;

public class Hamming
{
  public static int Compute(string first, string second)
  {
    return first.Zip(second, (f, s) => new {f, s}).Count(x => x.f != x.s);
  }
}
