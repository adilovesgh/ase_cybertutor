class TutorsController < ApplicationController
	def index
        @subject = Subject.find(params[:subject_id])
        @tutors = @subject.tutors

        Tutor.update_average(@tutors)
    end

    def show
        @tutor = Tutor.find(params[:id])
    end

    def new
        @subject = Subject.find(params[:subject_id])
    end

    def create
    	@subject = Subject.find(params[:subject_id])
        @tutor = @subject.tutors.build(tutor_params)
        @tutor.save
        redirect_to subject_tutors_path(params[:subject_id])
    end

    private
    def tutor_params
        params.require(:tutor).permit(:name, :experience, :subject, :rate)
    end
end
