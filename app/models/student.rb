class Student < ActiveRecord::Base
   has_many :reviews
   has_many :sessions
   has_many :requests
   belongs_to :account
end
