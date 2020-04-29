class AccountsController < ApplicationController
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	def index
        @accounts = Account.all
    end

    def show
        if !logged_in?
            redirect_to login_path
        elsif params[:id].to_i != session[:account_id]
            puts("param =#{params[:id].class}  \nsession=#{session[:account_id].class} \n #{params[:id] != session[:account_id]}"    )
            redirect_to account_path(session[:account_id])
        end
        @account=current_user
        @tutor=@account.tutor
        @student=@account.student
        @tutor_sessions = @account.tutor.sessions.where(:seen => false)
        @student_sessions_approved = @account.student.sessions.where(:seen_student => false, :verified => true)
        @student_sessions_rejected = @account.student.sessions.where(:seen_student => false, :verified => false)
    end

    def new
    end

    def edit
    	
    end

    def logout
    	reset_session
        redirect_to root_path
    end

    def create
        
        @account = Account.new(account_params)
        #@account.price_cents = 50.00
        if @account.email == "" || @account.name == "" or @account.password == ""
            redirect_to new_account_path, flash: {error: "All Fields are Mandatory"}
            return
        elsif !@account.email.match(VALID_EMAIL_REGEX)
            redirect_to new_account_path, flash: {error: "Invalid Email Address"}
            return
        elsif @account.password.length < 5
            redirect_to new_account_path, flash: {error: "Password Must Be 5 Characters or Longer"}
            return
        elsif Account.exists?(email: @account.email)
            redirect_to new_account_path, flash: {error: "Account already exists with that email"}
            return
        
        end
        @student = @account.build_student()
        @tutor = @account.build_tutor(price_cents:20.00)
        @account.notification = 0
        @account.save
        session[:account_id] = @account.id
        redirect_to account_path(@account)
    end

    private
    def account_params
        params.require(:account).permit(:name, :email, :password)
    end
end
