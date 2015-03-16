using System.Collections.Generic;
using System.Linq;

public class School
{
  private readonly Dictionary<int, SortedList<string, string>> _roster
    = new Dictionary<int, SortedList<string, string>>();

  public IList<List<string>> Roster
  {
    get
    {
      return 0.UpTo(MaxGrade).Select(Grade).ToList();
    }
  }

  public List<string> Grade(int grade)
  {
    return _roster.ContainsKey(grade)
      ? _roster[grade].Values.ToList()
      : new List<string>();
  }

  public void Add(string name, int grade)
  {
    EnsureGradeInitialized(grade);
    AddNameToGrade(name, grade);
  }

  private int MaxGrade
  {
    get
    {
      return _roster.Any() ? _roster.Keys.Max() : -1;
    }
  }

  private void EnsureGradeInitialized(int grade)
  {
    if (!_roster.ContainsKey(grade))
      _roster.Add(grade, new SortedList<string, string>());
  }

  private void AddNameToGrade(string name, int grade)
  {
    _roster[grade].Add(name, name);
  }
}

public static class Range
{
  public static IEnumerable<int> UpTo(this int from, int to)
  {
    return to < from
      ? Enumerable.Empty<int>()
      : Enumerable.Range(from, to - from + 1);
  }
}
