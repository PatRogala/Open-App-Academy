class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student,
             class_name: 'User',
             foreign_key: :student_id
end
