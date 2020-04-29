class TutorRequestsController < ApplicationController
	def index
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        else
            redirect_to login_path
        end
        @tutor_request = TutorRequest.all
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    end

    def tutor_approve
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        if @account.is_reviewer 
            
        	@tutor_request = TutorRequest.find(params[:id])
            if @account.tutor == @tutor_request.tutor
                flash[:error] = "You cannot approve yourself!"
                redirect_to tutor_requests_path
            else
            	@subject = @tutor_request.subject
            	@tutor = @tutor_request.tutor
            	@subject.tutors << @tutor
            	@tutor_request.destroy
            	redirect_to tutor_requests_path
            end
        else
            flash[:error] = "You do not have authority to approve a tutor!"
            redirect_to tutor_requests_path
        end
    end
end
