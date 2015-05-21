using System;
using System.Collections.Generic;
using System.Linq;

public class DNA
{
  private static readonly char[] ValidNucleotides
    = {'A', 'T', 'C', 'G'};
  private readonly string _nucleotides;
  private Dictionary<char, int> _charCounts;

  public DNA(string nucleotides)
  {
    _nucleotides = nucleotides;
  }

  public Dictionary<char, int> NucleotideCounts
  {
    get
    {
      return ValidNucleotides.ToDictionary(
        n => n,
        n => CharCounts.ContainsKey(n) ? CharCounts[n] : 0);
    }
  }

  public int Count(char nucleotide)
  {
    if (!ValidNucleotides.Contains(nucleotide))
      throw new InvalidNucleotideException();
    return NucleotideCounts[nucleotide];
  }

  private Dictionary<char, int> CharCounts
  {
    get
    {
      return _charCounts ??
             (_charCounts = _nucleotides.
               GroupBy(n => n).
               ToDictionary(g => g.Key, g => g.Count()));
    }
  }
}

public class InvalidNucleotideException : Exception
{
}
