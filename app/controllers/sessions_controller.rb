class SessionsController < ApplicationController
    def index
        @account = Account.find(session[:account_id])
        @sessions = @account.student.sessions.order(:start_time)
        @teaching_sessions = @account.tutor.sessions
        @account.notification = 0
        @account.save
        for s in @sessions
            unless s.seen_student
                s.seen_student = true
                s.save
            end
        end
        for s in @teaching_sessions
            unless s.seen
                s.seen = true
                s.save
            end
        end
    end

    def show
        @account = Account.find(session[:account_id])
        @clicked_subject = Subject.find(params["subject_id"])
        @tutor = Tutor.find(params["tutor_id"])
        @session = Session.find(params["id"])

        @whiteboard_url = "https://wbo.ophir.dev/boards/" + @session.whiteboard_id
        if(@account.name == @session.student.account.name)
            @other_account = @session.tutor.account
        else
            @other_account = @session.student.account
        end
	
    	session[:conversations] ||= []
	    @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
    end

    def approve
        @account = Account.find(session[:account_id])
        @sessions = @account.tutor.sessions
        @session = Session.find(params["id"])
        if Session.no_conflicting_times(@session, @sessions)
            @session.update_attributes(:pending => false, :verified => true, :seen_student => false)
            @session.student.account.notification += 1
            @session.student.account.save
        else 
            flash[:error] = "Approving this will cause a scheduling conflict!"
        end
        redirect_to subject_tutor_sessions_path(0, 0)
    end

    def reject
        @account = Account.find(session[:account_id])
        @session = Session.find(params["id"])
        @session.update_attributes(:pending => false, :verified => false, :seen_student => false)
        @session.student.account.price_cents += @session.price_cents
        @session.student.account.notification += 1
        @session.student.account.save
        redirect_to subject_tutor_sessions_path(0, 0)
    end

    def new
        @account = Account.find(session[:account_id])
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
                    @student = @account.student
                    @price = Session.compute_session_cost(@tutor.price_cents, params["session"])
                    if @price > @account.price_cents
                        errors = ["You do not have enough balance!", "Your Balance: $#{Order.print_money @account.price_cents}", "Total Price: $#{(@price.to_f/100).round(2)}"]
                        flash[:error] = errors
                        redirect_to new_subject_tutor_session_path
                    else
                        @subject = Subject.find(params[:subject_id])
                        whiteboard = generate_session_whiteboard(@start_time)
                        @session = @tutor.sessions.build(subject:@subject, student:@student, price_cents:@price, start_time:@start_time, end_time:@end_time, pending:true, verified:false, seen:false, seen_student:true, whiteboard_id:whiteboard, completed:false)
                        @session.save
                        @account.price_cents -= @price.to_i
                        @account.save
                        @tutor.account.notification += 1
                        @tutor.account.save
                        redirect_to subject_tutor_sessions_path(1,1)
                    end
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

    def generate_session_whiteboard(start_time)
        timestring = start_time.utc.strftime('%m%d%Y%H%M')
        length = 10
        randstring = rand(36**length).to_s(36)
        ret = randstring+timestring
        puts ret
        return ret
    end
end
