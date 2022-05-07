class User < ApplicationRecord
  has_many :enrollments,
           foreign_key: :student_id

  has_many :enrolled_courses, through: :enrollments, source: :course
end
