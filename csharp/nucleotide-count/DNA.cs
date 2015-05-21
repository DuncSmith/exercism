using System;
using System.Collections.Generic;
using System.Linq;

public class DNA
{
  private static readonly char[] ValidNucleotides
    = {'A', 'T', 'C', 'G'};
  private readonly string _nucleotides;

  public DNA(string nucleotides)
  {
    _nucleotides = nucleotides;
  }

  public Dictionary<char, int> NucleotideCounts
  {
    get
    {
      var counts = _nucleotides.
        GroupBy(n => n).
        ToDictionary(g => g.Key, g => g.Count());
      return ValidNucleotides.ToDictionary(
        n => n,
        n => counts.ContainsKey(n) ? counts[n] : 0);
    }
  }

  public int Count(char nucleotide)
  {
    if (!ValidNucleotides.Contains(nucleotide))
      throw new InvalidNucleotideException();
    return NucleotideCounts[nucleotide];
  }
}

public class InvalidNucleotideException : Exception
{
}
