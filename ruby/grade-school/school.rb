class School
  def to_hash
    Hash[grade_numbers.map { |grade_number| sorted_grade grade_number }]
  end

  def add(student_name, grade_number)
    (students[grade_number] ||= []) << student_name
  end

  def grade(grade_number)
    (students[grade_number] || []).sort
  end

  private

  def students
    @students ||= {}
  end

  def grade_numbers
    students.keys.sort
  end

  def sorted_grade(grade_number)
    [grade_number, grade(grade_number)]
  end
end
