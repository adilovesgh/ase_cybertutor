class SubjectsController < ApplicationController
	def index
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        @subjects = Subject.all.order(:name)
        if session[:account_id].nil?
            @logged_in = false
            puts(session[:account_id])
            puts(session)
        else
            @logged_in = true
        end
    end

    def show
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        @subject = Subject.find(params[:id])
        @tutors = @subject.tutors
        Tutor.update_average(@tutors)
    end

    def new
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
    end

    def create
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        @subject = Subject.new(subject_params)
        @subject.save
        redirect_to subjects_path
    end

    private
    def subject_params
        params.require(:subject).permit(:name)
    end
end
