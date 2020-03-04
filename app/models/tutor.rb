class Tutor < ActiveRecord::Base
    has_and_belongs_to_many :subjects
    has_many :reviews
    has_many :sessions

    def self.update_average(tutors)
    	tutors.each {|tutor|
            unless tutor.reviews.average(:rating).nil?
                tutor.average_rating=tutor.reviews.average(:rating).round(2)
            else
                tutor.average_rating=0
            end
        }
    end
end
