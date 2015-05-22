using System.Linq;

public class PhoneNumber
{
  private static readonly string InvalidNumber = new string('0', 10);
  private readonly string _number;
  private string _cleanedNumber;
  private string _processedNumber;

  public PhoneNumber(string number)
  {
    _number = number;
  }

  public string Number
  {
    get
    {
      if (_processedNumber != null)
        return _processedNumber;
      if (NumberInvalid)
        _processedNumber = InvalidNumber;
      else if (NumberIncludesUScountryCode)
        _processedNumber = RemoveUScountryCode(CleanedNumber);
      else
        _processedNumber = CleanedNumber;
      return _processedNumber;
    }
  }

  public string AreaCode
  {
    get
    {
      return Number.Substring(0, 3);
    }
  }

  public override string ToString()
  {
    return string.Format(
      "({0}) {1}-{2}", AreaCode, ExchangeCode, SubscriberNumber);
  }

  private string ExchangeCode
  {
    get
    {
      return Number.Substring(3, 3);
    }
  }

  private string SubscriberNumber
  {
    get
    {
      return Number.Substring(6);
    }
  }

  private bool NumberInvalid
  {
    get
    {
      return CleanedNumber.Length != 10 &&
             !NumberIncludesUScountryCode;
    }
  }

  private bool NumberIncludesUScountryCode
  {
    get
    {
      return CleanedNumber.Length == 11 &&
             CleanedNumber.StartsWith("1");
    }
  }

  private static string RemoveUScountryCode(string number)
  {
    return number.Substring(1);
  }

  private string CleanedNumber
  {
    get
    {
      return _cleanedNumber ??
             (_cleanedNumber =
               _number.Remove(new[] {"(", ")", "-", " ", "."}));
    }
  }
}

public static class StringExtensions
{
  public static string Remove(this string str, string[] values)
  {
    return str.Replace(values, string.Empty);
  }

  public static string Replace(
    this string str, string[] oldValues, string newValue)
  {
    return oldValues
      .Aggregate(str, (s, oldValue) => s.Replace(oldValue, newValue));
  }
}
