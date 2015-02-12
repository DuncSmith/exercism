using System.Collections.Generic;

public class Phrase
{
  private readonly string _text;

  public Phrase(string text)
  {
    _text = text;
  }

  public Dictionary<string, int> WordCount()
  {
    return _text == string.Empty
      ? new Dictionary<string, int>()
      : new Dictionary<string, int>{{_text, 1}};
  }
}
