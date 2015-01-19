using System.Text.RegularExpressions;

public class Bob
{
  public string Hey(string phrase)
  {
    if (Shouted(phrase)) return "Whoa, chill out!";
    if (Question(phrase)) return "Sure.";
    if (Silent(phrase)) return "Fine. Be that way!";
    return "Whatever.";
  }

  private static bool Shouted(string phrase)
  {
    return IsUppercase(phrase) && ContainsLetters(phrase);
  }

  private static bool IsUppercase(string phrase)
  {
     return phrase.Equals(phrase.ToUpper());
  }

  private static bool ContainsLetters(string phrase)
  {
    // match at least one unicode letter (posix not supported in .NET)
    return Regex.IsMatch(phrase, @"\p{L}");
  }

  private static bool Question(string phrase)
  {
    return phrase.Trim().EndsWith("?");
  }

  private static bool Silent(string phrase)
  {
    return phrase.Trim().Equals(string.Empty);
  }
}
