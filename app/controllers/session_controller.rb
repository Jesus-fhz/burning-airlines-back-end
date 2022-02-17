class SessionController < ApplicationController
    def new

    end
  
    def create
        #If we want to add the sign up function#
        user = User.find_by email: params[:email]
        if user.present? && user.authenticate(params[:password])
          if user.admin === true 
            session[:user_id] = user.id
            redirect_to root_path
          else
            redirect_to login_path
            flash[:error] = "Sorry, you don't have access."
          end
        else    
          redirect_to login_path
          flash[:error] = "Bad Credentials, try again."
        end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to login_path
    end
  end
  