class TutorReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :tutor
end
