class Subject < ActiveRecord::Base
    has_and_belongs_to_many :tutors
    has_many :sessions
    has_many :tutor_requests
end
