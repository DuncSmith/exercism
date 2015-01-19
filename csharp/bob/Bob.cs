using System.Text.RegularExpressions;

public class Bob
{
  public string Hey(string words)
  {
    return React.ToShout(words)    |
           React.ToQuestion(words) |
           React.ToSilence(words)  |
           React.WithIndifference();
  }
}

public static class React
{
  public static Reaction ToShout(string phrase)
  {
    return new ShoutReaction(phrase);
  }

  public static Reaction ToQuestion(string phrase)
  {
    return new QuestionReaction(phrase);
  }

  public static Reaction ToSilence(string phrase)
  {
    return new SilenceReaction(phrase);
  }

  public static Reaction WithIndifference()
  {
    return new IndifferentReaction();
  }
}

public abstract class Reaction
{
  protected Reaction(string phrase)
  {
    Phrase = phrase;
  }

  protected string Phrase { get; private set; }

  public abstract bool Triggered();

  public abstract string Response();

  public static Reaction operator |(Reaction first, Reaction second)
  {
    return first.Triggered() ? first : second;
  }

  public static implicit operator string(Reaction reaction)
  {
    return reaction.Response();
  }
}

public class ShoutReaction : Reaction
{
  public ShoutReaction(string phrase) : base(phrase)
  {
  }

  public override bool Triggered()
  {
    return IsUppercase && ContainsLetters;
  }

  private bool IsUppercase
  {
    get { return Phrase.Equals(Phrase.ToUpper()); }
  }

  private bool ContainsLetters
  {
    get
    {
      // match at least one unicode letter (posix not supported in .NET)
      return Regex.IsMatch(Phrase, @"\p{L}");
    }
  }

  public override string Response()
  {
    return "Whoa, chill out!";
  }
}

public class QuestionReaction : Reaction
{
  public QuestionReaction(string phrase) : base(phrase)
  {
  }

  public override bool Triggered()
  {
    return Phrase.Trim().EndsWith("?");
  }

  public override string Response()
  {
    return "Sure.";
  }
}

public class SilenceReaction : Reaction
{
  public SilenceReaction(string phrase) : base(phrase)
  {
  }

  public override bool Triggered()
  {
    return Phrase.Trim().Equals(string.Empty);
  }

  public override string Response()
  {
    return "Fine. Be that way!";
  }
}

public class IndifferentReaction : Reaction
{
  public IndifferentReaction() : base(string.Empty)
  {
  }

  public override bool Triggered()
  {
    return true;
  }

  public override string Response()
  {
    return "Whatever.";
  }
}
