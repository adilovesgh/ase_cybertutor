class Tutor < ActiveRecord::Base
    has_and_belongs_to_many :subjects
    has_many :reviews
end
