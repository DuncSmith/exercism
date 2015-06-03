class School
  def to_hash
    # deep copy to also clone arrays of students in grades
    Hash[grade_numbers.map { |grade_number| clone_grade grade_number }]
  end

  def add(student_name, grade_number)
    (students[grade_number] ||= []) << student_name
  end

  def grade(grade_number)
    sorted_grades[grade_number] ? sorted_grades[grade_number].clone : []
  end

  private

  def students
    @students ||= {}
  end

  def grade_numbers
    students.keys.sort
  end

  def sorted_grades
    Hash[grade_numbers.map { |grade_number| sort_grade grade_number }]
  end

  def sort_grade(grade_number)
    [grade_number, get_grade(grade_number).sort]
  end

  def clone_grade(grade_number)
    [grade_number, grade(grade_number)]
  end

  def get_grade(grade_number)
    students[grade_number] || []
  end
end