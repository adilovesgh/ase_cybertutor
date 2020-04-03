class SessionsController < ApplicationController
    def index
        @account = Account.find(session[:account_id])
        @sessions = @account.student.sessions
        @teaching_sessions = @account.tutor.sessions
    end

    def show
        @clicked_subject = Subject.find(params["subject_id"])
        @tutor = Tutor.find(params["tutor_id"])
        @session = Session.find(params["id"])
    end

    def approve
        @account = Account.find(session[:account_id])
        @sessions = @account.tutor.sessions
        @session = Session.find(params["id"])
        if Session.no_conflicting_times(@session, @sessions)
            @session.update_attributes(:pending => false, :verified => true)
        else 
            flash[:error] = "Approving this will cause a scheduling conflict!"
        end
        redirect_to subject_tutor_sessions_path(0, 0)
    end

    def reject
        @session = Session.find(params["id"])
        @session.update_attributes(:pending => false, :verified => false)
        redirect_to subject_tutor_sessions_path(0, 0)
    end

    def new
        @tutor = Tutor.find(params["tutor_id"])
        @subject = Subject.find(params["subject_id"])
        @days = Array.new(31) {|i| i+1 }
        @hours = Array.new(12) {|i| i+1}
        @minutes = Array.new(12) {|i|
            i = i * 5
            i.to_s
        }
    end

    def create
        @account = Account.find(session[:account_id])
        @student = @account.student
        if params[:tutor_id].to_s == @account.tutor.id.to_s
            flash[:error] = "You cannot sign up for your own tutoring sessions."
            redirect_to subject_tutor_sessions_path(1,1)
        else
            #eventually differentiate it with start and end time
            @time = Session.convert_time(params["session"])
            @start_time = @time[0]
            @end_time = @time[1]
            if @end_time == @start_time
                flash[:error] = "Cannot sign up for 0 minutes"
                redirect_to new_subject_tutor_session_path
            elsif @start_time < DateTime.now
                flash[:error] = "Start time cannot be in the past"
                redirect_to new_subject_tutor_session_path
            else
                @sessions = @account.student.sessions
                if Session.no_student_conflicting_times(@time, @sessions)
                    @tutor = Tutor.find(params[:tutor_id])
                    @price = Session.compute_session_cost(@tutor.price_cents, params["session"])
                    @subject = Subject.find(params[:subject_id])
                    session[:tutor] = @tutor
                    session[:subject] = @subject
                    session[:start_time] = @start_time
                    session[:end_time] = @end_time
                    session[:price] = @price
                    session[:price_cents] = @price * 100

                    redirect_to :controller=>"orders",
                                :action=>"index"
                else
                    flash[:error] = "You already have a session conflicting with this!"
                    redirect_to new_subject_tutor_session_path
                end
            end
        end
    end

    private
    def session_params
        params.require(:session).permit()
    end
end