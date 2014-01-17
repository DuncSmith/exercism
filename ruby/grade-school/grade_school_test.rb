require 'minitest/autorun'
require_relative 'school'

class SchoolTest < MiniTest::Unit::TestCase

  def school
    @school
  end

  def setup
    @school = School.new
  end

  def test_an_empty_school
    assert_equal({}, school.to_hash)
  end

  def test_add_student
    school.add("Aimee", 2)
    assert_equal({2 => ["Aimee"]}, school.to_hash)
  end

  def test_add_more_students_in_same_class
    school.add("Blair", 2)
    school.add("James", 2)
    school.add("Paul", 2)
    assert_equal({2 => ["Blair", "James", "Paul"]}, school.to_hash)
  end

  def test_add_students_to_different_grades
    school.add("Chelsea", 3)
    school.add("Logan", 7)
    assert_equal({3 => ["Chelsea"], 7 => ["Logan"]}, school.to_hash)
  end

  def test_get_students_in_a_grade
    school.add("Bradley", 5)
    school.add("Franklin", 5)
    school.add("Jeff", 1)
    assert_equal ["Bradley", "Franklin"], school.grade(5)
  end

  def test_get_students_sorted_in_a_grade
    school.add("Franklin", 5)
    school.add("Bradley", 5)
    school.add("Jeff", 1)
    assert_equal ["Bradley", "Franklin"], school.grade(5)
  end

  def test_get_students_in_a_non_existant_grade
    assert_equal [], school.grade(1)
  end

  def test_sort_school
    school.add("Jennifer", 4)
    school.add("Kareem", 6)
    school.add("Christopher", 4)
    school.add("Kyle", 3)
    sorted = {
      3 => ["Kyle"],
      4 => ["Christopher", "Jennifer"],
      6 => ["Kareem"]
    }
    assert_equal sorted, school.to_hash
    assert_equal [3, 4, 6], school.to_hash.keys
  end

  def test_get_students_in_a_non_existant_grade_does_not_mutate_db
    # empty db should stay empty
    assert_equal({}, school.to_hash)
    school.grade(2)
    assert_equal({}, school.to_hash)
  end

  def test_cannot_externally_mutate_empty_internal_db
    school.to_hash[2] = ["William", "Samantha"]
    assert_equal [], school.grade(2)
  end

  def test_distinct_db_everytime
    refute_same school.to_hash, school.to_hash
  end

  def test_cannot_externally_mutate_non_empty_internal_db
    school.add('William', 2)
    school.to_hash[2] << 'Samantha';
    assert_equal ['William'], school.grade(2)
  end
end
