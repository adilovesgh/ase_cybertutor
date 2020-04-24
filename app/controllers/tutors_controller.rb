class TutorsController < ApplicationController
    def index
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        @tutors = Tutor.all
    end

    def show
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        @subjects = @account.tutor.subjects
    end

    def new
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
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
        #@account = nil
        #unless session[:account_id].nil?
        #    @account = Tutor.find(session[:account_id])
        #end
    	#@subject = Subject.find(params[:subject_id])
        #@tutor = @subject.tutors.build(tutor_params)
        #@tutor.save
        #redirect_to subject_tutors_path(params[:subject_id])
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        puts(tutor_params[:rate])
        @rate = tutor_params[:rate].to_f
        #change it later
        if true
            @account.tutor.price_cents = @rate
            @account.tutor.save
            redirect_to account_path(@account)
        else
            flash[:error] = "Please enter in a valid rate."
            redirect_to new_tutor_path
        end
        
    end

    private
    def tutor_params
        params.require(:tutor).permit(:rate)
    end
end
