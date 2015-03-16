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
      return RosterUpToGrade(MaxGrade);
    }
  }

  public List<string> Grade(int grade)
  {
    return RosterUpToGrade(grade)[grade];
  }

  public void Add(string name, int grade)
  {
    EnsureGradeInitialized(grade);
    AddNameToGrade(name, grade);
  }

  private IList<List<string>> RosterUpToGrade(int gradeTo)
  {
    return 0.UpTo(gradeTo).Select(
      grade =>
        _roster.ContainsKey(grade)
          ? _roster[grade].Values.ToList()
          : new List<string>()).ToList();
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
