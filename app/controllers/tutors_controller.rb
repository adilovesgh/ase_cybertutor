class TutorsController < ApplicationController
    def index
        @account = nil
        unless session[:account_id].nil?
            @account = Tutor.find(session[:account_id])
        end
        @tutors = Tutor.all
    end

    def show
        @account = nil
        unless session[:account_id].nil?
            @account = Tutor.find(session[:account_id])
        end
        @subjects = @account.tutor.subjects
    end

    def new
        @account = nil
        unless session[:account_id].nil?
            @account = Tutor.find(session[:account_id])
        end
        @subject = Subject.find(params[:subject_id])
    end

    def edit
        @subject = Subject.find(params[:id])
        @account = Account.find(session[:account_id])
        unless(@subject.tutors.exists?(id:@account.tutor.id))
            @subject.tutors << @account.tutor
        else
            flash[:error] = "You are already signed up to tutor this subject."
        end
        redirect_to tutor_path(@account.tutor)
    end


    def create
        @account = nil
        unless session[:account_id].nil?
            @account = Tutor.find(session[:account_id])
        end
    	@subject = Subject.find(params[:subject_id])
        @tutor = @subject.tutors.build(tutor_params)
        @tutor.save
        redirect_to subject_tutors_path(params[:subject_id])
    end

    private
    def tutor_params
        params.require(:tutor).permit(:name, :experience, :subject, :price_cents)
    end
end
