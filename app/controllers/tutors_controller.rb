class TutorsController < ApplicationController
    
    def index
        @tutors = Tutor.all
    end

    def show
        @tutor = Tutor.find(params[:id])
    end

    def new
    end

    def create
        @tutor = Tutor.new(tutor_params)
        @tutor.save
        redirect_to tutors_path
    end

    private
    def tutor_params
        params.require(:tutor).permit(:name, :experience, :subject, :rate)
    end
end
