class TutorsController < ApplicationController
	def index
        @subject = Subject.find(params[:subject_id])
        @tutors = @subject.tutors

        @tutors.each {|tutor|
            unless tutor.reviews.average(:rating).nil?
                tutor.average_rating=tutor.reviews.average(:rating).round(2)
            else
                tutor.average_rating=0
            end
        }
    end

    def show
        @tutor = Tutor.find(params[:id])
    end

    def new
        @subject = Subject.find(params[:subject_id])
    end

    def create
    	@subject = Subject.find(params[:subject_id])
        @tutor = @subject.tutors.create(tutor_params)
        @tutor.save
        redirect_to subject_tutors_path(params[:subject_id])
    end

    private
    def tutor_params
        params.require(:tutor).permit(:name, :experience, :subject, :rate)
    end
end
