class Course < ApplicationRecord
  has_many :enrollments

  has_many :enrolled_students,
           through: :enrollments,
           source: :student

  belongs_to :prerequisite,
             class_name: 'Course',
             foreign_key: :prereq_id

  belongs_to :instructor,
             class_name: 'User',
             foreign_key: :instructor_id
end
