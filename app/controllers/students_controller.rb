class StudentsController < ApplicationController
	def index
        @account = nil
        unless session[:account_id].nil?
            @account = Tutor.find(session[:account_id])
        end
        @sessions = @account.student.sessions
        @teaching_sessions = @account.tutor.sessions
    end

    def show
        @account = nil
        unless session[:account_id].nil?
            @account = Tutor.find(session[:account_id])
        end
        @student = Student.find(params[:id])
    end

    def new
    end

    def create
        @account = nil
        unless session[:account_id].nil?
            @account = Tutor.find(session[:account_id])
        end
        @student = Student.new(student_params)
        @student.save
        redirect_to students_path
    end

    private
    def student_params
        params.require(:student).permit(:name)
    end
end
