using System.Collections.Generic;
using System.Linq;

public class School
{
  private readonly List<SortedList<string, string>> _roster =
    new List<SortedList<string, string>>();

  public IList<List<string>> Roster
  {
    get
    {
      return _roster.Select(GradeAsList).ToList();
    }
  }

  public void Add(string name, int grade)
  {
    EnsureGradeInitialized(grade);
    AddNameToGrade(name, grade);
  }

  public List<string> Grade(int grade)
  {
    return _roster.Count <= grade
      ? new List<string>()
      : GradeAsList(_roster[grade]);
  }

  private static List<string> GradeAsList(SortedList<string, string> grade)
  {
    return grade.Values.ToList();
  }

  private void EnsureGradeInitialized(int grade)
  {
    while (_roster.Count <= grade)
      _roster.Add(new SortedList<string, string>());
  }

  private void AddNameToGrade(string name, int grade)
  {
    _roster[grade].Add(name, name);
  }
}
