class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :is_buyer?, :is_seller?, :is_admin?

    def current_user
        if session[:username]
            if Buyer.find_by(first_name: session[:username]) == nil
		    	@current_user ||= Seller.find_by(first_name: session[:username]) 
		    else
		    	@current_user ||= Buyer.find_by(first_name: session[:username])
            end
        end
    end

    def logged_in?
        !!current_user
    end

    def is_buyer?
        if logged_in?
            current_user.instance_of? Buyer
        end
    end

    def is_seller?
        if logged_in?
            current_user.instance_of? Seller
        end
    end

    def is_admin?
        if logged_in?
            current_user.admin
        end
    end
    

    def require_user
        if !logged_in?
            flash[:danger] = "not logged in"
            redirect_to root_path
        end
    end

    def require_buyer
        if !is_buyer?
            flash[:danger] = "not a buyer account"
            redirect_to root_path
        end
    end

    def require_seller
        if !is_seller?
            flash[:danger] = "not a seller account"
            redirect_to root_path
        end
    end

    def require_admin
        if !is_admin?
            flash[:danger] = "not a seller account"
            redirect_to root_path
        end
    end
end
