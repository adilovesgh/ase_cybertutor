class SubjectsController < ApplicationController
	def index
        @subjects = Subject.all
        if session[:account_id].nil?
            @logged_in = false
            puts(session[:account_id])
            puts(session)
        else
            @logged_in = true
        end
    end

    def show
        @subject = Subject.find(params[:id])
        @tutors = @subject.tutors
        Tutor.update_average(@tutors)
    end

    def new
    end

    def create
        @subject = Subject.new(subject_params)
        @subject.save
        redirect_to subjects_path
    end

    private
    def subject_params
        params.require(:subject).permit(:name)
    end
end
