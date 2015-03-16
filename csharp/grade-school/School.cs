using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class School
{
  private readonly InitializingCollection<SortedList<string, string>> _roster =
    new InitializingCollection<SortedList<string, string>>();

  public IList<List<string>> Roster
  {
    get
    {
      return _roster.Select(grade => grade.Values.ToList()).ToList();
    }
  }

  public void Add(string name, int grade)
  {
    _roster[grade].Add(name, name);
  }

  public List<string> Grade(int grade)
  {
    return _roster[grade].Values.ToList();
  }
}

public class InitializingCollection<T> : IEnumerable<T> where T : new()
{
  private readonly List<T> _internalList = new List<T>();

  public IEnumerator<T> GetEnumerator()
  {
    return _internalList.GetEnumerator();
  }

  IEnumerator IEnumerable.GetEnumerator()
  {
    return ((IEnumerable) _internalList).GetEnumerator();
  }

  public T this[int index]
  {
    get
    {
      PadToIndex(index);
      return _internalList[index];
    }
    set
    {
      PadToIndex(index);
      _internalList[index] = value;
    }
  }

  private void PadToIndex(int index)
  {
    while (IndexOutOfBounds(index))
      _internalList.Add(new T());
  }

  private bool IndexOutOfBounds(int index)
  {
    return _internalList.Count <= index;
  }
}
