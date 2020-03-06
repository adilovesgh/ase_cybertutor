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
        if params[:tutor_id].to_s == @account.tutor.id.to_s
            flash[:error] = "You cannot sign up for your own tutoring sessions"
            redirect_to subject_tutor_sessions_path(1,1)
        else
            #eventually differentiate it with start and end time
        	@time = Session.convert_time(params["session"])
            @start_time = @time[0]
            @end_time = @time[1]
            if @start_time < DateTime.now || @end_time < @start_time
                if @start_time < DateTime.now
                    flash[:error] = "Start time cannot be in the past"
                else
                    flash[:error] = "End time must be after start time"
                end
                redirect_to new_subject_tutor_session_path
            else
                @tutor = Tutor.find(params[:tutor_id])
                @subject = Subject.find(params["subject_id"])
                @session = @tutor.sessions.build(subject:@subject, student:@student, start_time:@start_time, end_time:@end_time)
                @session.save
                redirect_to subject_tutor_sessions_path(1,1)
            end
        end
    end

    private
    def session_params
        params.require(:student).permit(:name)
    end
end
