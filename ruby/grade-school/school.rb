class School
  def db
    students
  end

  def add(student_name, grade_number)
    students_by_grade(grade_number) << student_name
  end

  def grade(grade_number)
    students_by_grade(grade_number).clone
  end

  def sort
    Hash[sorted_grade_numbers.map { |grade_number| sort_grade(grade_number) }]
  end

  private

  def students
    @students ||= {}
  end

  def students_by_grade(grade_number)
    students[grade_number] ||= []
  end

  def sort_grade(grade_number)
    [grade_number, students_by_grade(grade_number).sort]
  end

  def sorted_grade_numbers
    students.keys.sort
  end
end
