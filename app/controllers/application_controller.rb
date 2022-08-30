class ApplicationController < ActionController::Base

    before_action :fetch_user

    def fetch_user

        if session[:user_id].present?
          @current_user = User.find_by id: session[:user_id]
        end
    
     
        unless @current_user.present?
          session[:user_id] = nil
        end
    
    end

    def check_if_logged_in
        
        unless @current_user.present?
            flash[:error] = "You must be logged in to access here"
            redirect_to login_path
        end




    end


end
