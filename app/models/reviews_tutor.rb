class ReviewsTutor < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :review
end
