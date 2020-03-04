class SessionsController < ApplicationController
	def index
        @sessions = Session.all
    end

    def show
    end

    def new
    	@tutor = Tutor.find(params["tutor_id"])
    	@subject = Subject.find(params["subject_id"])
    	@days = Array.new(31) {|i| i+1 }
    	@hours = Array.new(12) {|i| i+1}
    	@minutes = Array.new(60) {|i| 
    		if i < 10
    			'0'+i.to_s
    		else
    			i.to_s
    		end
    	}
    end

    def create
    	@tutor = Tutor.find(params[:tutor_id])
    	@student = Student.find(1)
    	@time = Session.convert_time(params["session"])
    	@subject = Subject.find(params["subject_id"])
    	@session = @tutor.sessions.build(subject:@subject, student:@student, time:@time)
    	@session.save
        redirect_to student_path(1)
    end

    private
    def session_params
        params.require(:student).permit(:name)
    end
end
