class SubjectsTutor < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :subject
end
