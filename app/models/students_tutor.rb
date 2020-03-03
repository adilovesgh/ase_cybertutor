class StudentsTutor < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :students
end
