class AccountsController < ApplicationController
	def index
        @accounts = Account.all
    end

    def show
        @account = Account.find(params[:id])
        puts(@account.email)
        session[:account_id] = @account.id
        #@tutors = Tutor.all.select {|m| m.subject == @subject.name}
        @student = @account.student
        @tutor = @account.tutor
        puts(session[:account_id])
    end

    def new
    end

    def edit
        reset_session
        redirect_to accounts_path
    end

    def create
        @account = Account.new(account_params)
        puts(account_params)
        puts(@account.email)
        @student = @account.build_student()
        @tutor = @account.build_tutor()
        @account.save
        redirect_to accounts_path
    end

    private
    def account_params
        params.require(:account).permit(:name, :email)
    end
end
