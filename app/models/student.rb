class Student < ActiveRecord::Base
   has_and_belongs_to_many :tutors
   has_and_belongs_to_many :subjects
   has_many :reviews
end
