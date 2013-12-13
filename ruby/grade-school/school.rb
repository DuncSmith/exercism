class School
  def db
    students
  end

  def add(student_name, grade_number)
    students.add student_name, grade_number
  end

  def grade(grade_number)
    students.grade grade_number
  end

  def sort
    students.sort
  end

  private

  def students
    @students ||= Students.new
  end
end

class Students < Hash
  def add(student_name, grade_number)
    (self[grade_number] ||= []) << student_name
  end

  def grade(grade_number)
    self[grade_number] || []
  end

  def sort
    Hash[sorted_grade_numbers.map { |grade_number| sort_grade(grade_number) }]
  end

  private

  def sort_grade(grade_number)
    [grade_number, grade(grade_number).sort]
  end

  def sorted_grade_numbers
    self.keys.sort
  end
end
