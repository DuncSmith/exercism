using System.Collections.Generic;
using System.Text.RegularExpressions;

public class Bob
{
  private IDictionary<PhraseType, string> responses =
    new Dictionary<PhraseType, string>
    {
      {PhraseType.Shout, "Whoa, chill out!"},
      {PhraseType.Question, "Sure."},
      {PhraseType.Silence, "Fine. Be that way!"},
      {PhraseType.Statement, "Whatever."}
    };

  public string Hey(string words)
  {
    return responses[new Phrase(words).Type];
  }
}

public enum PhraseType
{
  Statement,
  Shout,
  Question,
  Silence
}

public class Phrase
{
  private string words;

  public Phrase(string words)
  {
    this.words = words;
  }

  public PhraseType Type
  {
    get
    {
      if (Shouted) return PhraseType.Shout;
      if (Question) return PhraseType.Question;
      if (Silent) return PhraseType.Silence;
      return PhraseType.Statement;
    }
  }

  private bool Shouted
  {
    get { return IsUppercase && ContainsLetters; }
  }

  private bool IsUppercase
  {
    get { return words.Equals(words.ToUpper()); }
  }

  private bool ContainsLetters
  {
    get
    {
      // match at least one unicode letter (posix not supported in .NET)
      return Regex.IsMatch(words, @"\p{L}");
    }
  }

  private bool Question
  {
    get { return words.Trim().EndsWith("?"); }
  }

  private bool Silent
  {
    get { return words.Trim().Equals(string.Empty); }
  }
}
