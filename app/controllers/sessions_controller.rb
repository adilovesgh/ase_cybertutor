class SessionsController < ApplicationController
	def index
        @account = Account.find(session[:account_id])
        @sessions = @account.student.sessions
        @teaching_sessions = @account.tutor.sessions
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
        @account = Account.find(session[:account_id])
    	@student = @account.student
        puts(params[:tutor_id])
        puts(@account.tutor.id)
        puts(params[:tutor_id].to_s == @account.tutor.id.to_s)
        if params[:tutor_id].to_s == @account.tutor.id.to_s

            flash[:error] = "You cannot sign up for your own tutoring sessions"
        else
            #eventually differentiate it with start and end time
        	@time = Session.convert_time(params["session"])
            @tutor = Tutor.find(params[:tutor_id])
        	@subject = Subject.find(params["subject_id"])
        	@session = @tutor.sessions.build(subject:@subject, student:@student, time:@time)
        	@session.save
        end
        redirect_to subject_tutor_sessions_path(1,1)
    end

    private
    def session_params
        params.require(:student).permit(:name)
    end
end
