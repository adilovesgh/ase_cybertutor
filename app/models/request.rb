class Request < ActiveRecord::Base
	belongs_to :student
	belongs_to :tutor
	belongs_to :session
end
