using System.Text.RegularExpressions;

public class Bob
{
  public string Hey(string words)
  {
    var phrase = new Phrase(words);
    if (phrase.Shouted) return "Whoa, chill out!";
    if (phrase.Question) return "Sure.";
    if (phrase.Silent) return "Fine. Be that way!";
    return "Whatever.";
  }
}

public class Phrase
{
  private string words;

  public Phrase(string words)
  {
    this.words = words;
  }

  public bool Shouted
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

  public bool Question
  {
    get { return words.Trim().EndsWith("?"); }
  }

  public bool Silent
  {
    get { return words.Trim().Equals(string.Empty); }
  }
}
