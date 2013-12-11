class School
  def db
    @database ||= {}
  end

  def add(name, grade)
    (db[grade] ||= []) << name
  end

  def grade(grade)
    db[grade] || []
  end

  def sort
    Hash[db.keys.sort.map { |grade| [grade, db[grade].sort] }]
  end
end
