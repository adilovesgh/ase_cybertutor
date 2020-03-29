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
    end
  end