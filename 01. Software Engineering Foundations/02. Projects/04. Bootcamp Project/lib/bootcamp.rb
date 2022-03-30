class Bootcamp
  attr_reader :name, :slogan, :teachers, :students

  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def hire(teacher)
    @teachers << teacher unless @teachers.include?(teacher)
  end

  def enroll(student)
    puts student
    return false if @students.size >= @student_capacity

    @students << student unless enrolled?(student)
    true
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.size / @teachers.size
  end

  def add_grade(student, grade)
    return false unless enrolled?(student)

    @grades[student] << grade
    true
  end

  def num_grades(student)
    @grades[student].size
  end

  def average_grade(student)
    return nil unless enrolled?(student) && num_grades(student).positive?

    @grades[student].sum / num_grades(student)
  end
end
