class TutorsController < ApplicationController
	def index
        @tutors = Tutor.all
    end

    def show
        @account = Account.find(session[:account_id])
        @subjects = @account.tutor.subjects
    end

    def new
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
    	@subject = Subject.find(params[:subject_id])
        @tutor = @subject.tutors.build(tutor_params)
        if(@tutor.rate.nil? or @tutor.rate == 0)
            puts("No rate specified")
            @tutor.rate = 20.00
        else
            puts("A rate was specified")
            @tutor.rate = @tutor.rate.round(2)
        end
        @tutor.save
        redirect_to subject_tutors_path(params[:subject_id])
    end

    private
    def tutor_params
        params.require(:tutor).permit(:name, :experience, :subject, :rate)
    end
end
