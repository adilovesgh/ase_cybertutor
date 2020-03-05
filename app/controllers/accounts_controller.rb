class AccountsController < ApplicationController
	def index
        @accounts = Account.all
    end

    def show
        @account = Account.find(params[:id])
        session[:account_id] = @account.id
        #@tutors = Tutor.all.select {|m| m.subject == @subject.name}
        @student = @account.student
        @tutor = @account.tutor
        puts(session[:account_id])
    end

    def new
    end

    def create
        @account = Account.new(subject_params)
        @student = @account.build_student(name:@account.name)
        @tutor = @account.build_tutor(name:@account.name)
        @account.save
        redirect_to accounts_path
    end

    private
    def subject_params
        params.require(:account).permit(:name)
    end
end
