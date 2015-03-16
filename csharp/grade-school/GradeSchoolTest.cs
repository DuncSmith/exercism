using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;

[TestFixture]
public class GradeSchoolTest
{
  private School _school;

  [SetUp]
  public void Setup()
  {
    _school = new School();
  }

  [Test]
  public void New_school_has_an_empty_roster()
  {
    Assert.That(_school.Roster, Has.Count.EqualTo(0));
  }

  [Test]
  public void Adding_a_student_adds_them_to_the_roster_for_the_given_grade()
  {
    _school.Add("Aimee", 2);
    var expected = new List<string> {"Aimee"};
    Assert.That(_school.Roster[2], Is.EqualTo(expected));
  }

  [Test]
  public void Adding_more_students_to_the_same_grade_adds_them_to_the_roster()
  {
    _school.Add("Blair", 2);
    _school.Add("James", 2);
    _school.Add("Paul", 2);
    var expected = new List<string> {"Blair", "James", "Paul"};
    Assert.That(_school.Roster[2], Is.EqualTo(expected));
  }

  [Test]
  public void Adding_students_to_different_grades_adds_them_to_the_roster()
  {
    _school.Add("Chelsea", 3);
    _school.Add("Logan", 7);
    Assert.That(_school.Roster[3], Is.EqualTo(new List<string> {"Chelsea"}));
    Assert.That(_school.Roster[7], Is.EqualTo(new List<string> {"Logan"}));
  }

  [Test]
  public void Grade_returns_the_students_in_that_grade_in_alphabetical_order()
  {
    _school.Add("Franklin", 5);
    _school.Add("Bradley", 5);
    _school.Add("Jeff", 1);
    var expected = new List<string> {"Bradley", "Franklin"};
    Assert.That(_school.Grade(5), Is.EqualTo(expected));
  }

  [Test]
  public void Grade_returns_an_empty_list_if_there_are_no_students_in_that_grade
    ()
  {
    Assert.That(_school.Grade(1), Is.EqualTo(new List<string>()));
  }

  [Test]
  public void Student_names_in_each_grade_in_roster_are_sorted()
  {
    _school.Add("Jennifer", 4);
    _school.Add("Kareem", 6);
    _school.Add("Christopher", 4);
    _school.Add("Kyle", 3);
    Assert.That(_school.Roster[3], Is.EqualTo(new List<string> {"Kyle"}));
    Assert.That(_school.Roster[4],
      Is.EqualTo(new List<string> {"Christopher", "Jennifer"}));
    Assert.That(_school.Roster[6], Is.EqualTo(new List<string> {"Kareem"}));
  }

  [Test]
  public void Roster_is_readonly()
  {
    _school.Add("Jack", 1);
    var roster = _school.Roster;
    roster[1].Add("Jill");

    var rosterAgain = _school.Roster;
    var grade = _school.Grade(1);

    Assert.That(rosterAgain[1], Has.Member("Jack"));
    Assert.That(rosterAgain[1], Has.No.Member("Jill"));
    Assert.That(grade, Has.Member("Jack"));
    Assert.That(grade, Has.No.Member("Jill"));
  }

  [Test]
  public void Grade_is_readonly()
  {
    _school.Add("Jack", 1);
    var grade = _school.Grade(1);

    grade.Add("Jill");

    var gradeAgain = _school.Grade(1);
    var roster = _school.Roster;
    Assert.That(gradeAgain, Has.Member("Jack"));
    Assert.That(gradeAgain, Has.No.Member("Jill"));
    Assert.That(roster[1], Has.Member("Jack"));
    Assert.That(roster[1], Has.No.Member("Jill"));
  }

  [Test]
  public void Range_starts_at_specified_value()
  {
    Assert.That(27.UpTo(99).First(), Is.EqualTo(27));
  }

  [Test]
  public void Range_ends_at_specified_value()
  {
    Assert.That(27.UpTo(99).Last(), Is.EqualTo(99));
  }

  [Test]
  public void Range_covers_the_whole_range()
  {
    Assert.That(1.UpTo(5).ToArray(), Is.EqualTo(new[] {1, 2, 3, 4, 5}));
  }

  [Test]
  public void Range_empty_when_to_before_from()
  {
    Assert.That(2.UpTo(1), Is.Empty);
  }
}
