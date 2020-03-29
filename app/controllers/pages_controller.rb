class PagesController < ApplicationController
    def home
        
    end

    def login
      if logged_in?
        redirect_to account_path(session[:account_id])
        return
      end
    end

    def login_post
      @account = Account.find_by(email: params[:account][:email])

      if @account && @account.authenticate(params[:account][:password])
        session[:account_id] = @account.id
        redirect_to root_path
      else
        redirect_to login_path, flash: {error: "Unrecognized email/password combination."}
      end

    end
  end