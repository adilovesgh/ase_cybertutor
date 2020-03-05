class StudentsController < ApplicationController
	def index
        @account = Account.find(session[:account_id])
        @sessions = @account.student.sessions
        @teaching_sessions = @account.tutor.sessions
    end

    def show
        @student = Student.find(params[:id])
    end

    def new
    end

    def create
        @student = Student.new(student_params)
        @student.save
        redirect_to students_path
    end

    private
    def student_params
        params.require(:student).permit(:name)
    end
end
