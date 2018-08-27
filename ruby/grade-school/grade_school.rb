class School

  attr_reader :all_students

  def initialize
    @all_students = []
  end

  def add(name, grade)
    if students(grade).empty?
      @all_students.push({ grade: grade, students: [name] })
    else
      students_in_particular(grade)[:students].push(name).sort!
    end
  end

  def students(grade)
    students_in_particular(grade).nil? ? [] : students_in_particular(grade)[:students]
  end

  def students_by_grade
    all_students.sort_by { |student| student[:grade] }
  end

  def students_in_particular(grade)
    @all_students.find { |student| student[:grade] == grade }
  end
end

module BookKeeping
  VERSION = 3
end