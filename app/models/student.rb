class Student < ActiveRecord::Base
   has_many :reviews
   has_many :sessions
   belongs_to :account
end
