public static class Year
{
  public static bool IsLeap(int year)
  {
    return year.DivisibleBy(400) ||
           (year.NotDivisibleBy(100) && year.DivisibleBy(4));
  }

  private static bool NotDivisibleBy(this int value, int divisor)
  {
    return !value.DivisibleBy(divisor);
  }

  private static bool DivisibleBy(this int value, int divisor)
  {
    return value%divisor == 0;
  }
}
