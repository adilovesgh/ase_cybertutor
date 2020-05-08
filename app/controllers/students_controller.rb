class StudentsController < ApplicationController
	def index
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        @sessions = @account.student.sessions
        @teaching_sessions = @account.tutor.sessions
    end

    def show
        @account = nil
        unless session[:account_id].nil?
            @account = Account.find(session[:account_id])
        end
        @student = Student.find(params[:id])
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
        @amount = student_params[:amount]
        #change it later
        r1 = /^\d+\.\d\d$/
        r2 = /^\d$/
        if @amount.match(r1) or @amount.to_i.to_s == @amount
            @amount = @amount.to_f * 100
            if @amount > @account.price_cents
                flash[:error] = "You cannot withdraw more than your balance."
                redirect_to new_student_path
            else
                @account.price_cents -= @amount
                @account.save
                redirect_to account_path(@account)
            end
        else
            flash[:error] = "Please enter in a valid rate."
            redirect_to new_student_path
        end
    end

    private
    def student_params
        params.require(:student).permit(:amount)
    end
end
