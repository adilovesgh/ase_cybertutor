class StudentsController < ApplicationController
	def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
        @sessions = @student.sessions
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
