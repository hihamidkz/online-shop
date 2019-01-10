class ApplicationController < ActionController::Base
    include CurrentCart
    before_action :set_cart
    helper_method :authenticate_admin

    def authenticate_admin
        if !user_signed_in?
            redirect_to root_path
            return true
        end
        return unless !current_user.admin?
        redirect_to root_path
    end 
end
