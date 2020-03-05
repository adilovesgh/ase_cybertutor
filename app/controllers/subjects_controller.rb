class SubjectsController < ApplicationController
	def index
        @account = Account.find_by_id(session[:account_id])
        @subjects = Subject.all
    end

    def show
        @subject = Subject.find(params[:id])
        @tutors = @subject.tutors
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
