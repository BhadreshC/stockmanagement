class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
    before_action :authenticate_user!

  protected
#     def configure_permitted_parameters
# 			devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation)}
# 			devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
#   	end
    def after_sign_in_path_for(resource)
      if current_user.status == true
        stored_location_for(resource) || stores_path
      else
        puts" bhjhjbhjhjhbbhhbjjhbjh"
        puts" bhjhjbhjhjhbbhhbjjhbjh"
        puts" bhjhjbhjhjhbbhhbjjhbjh"
        puts" bhjhjbhjhjhbbhhbjjhbjh"
      end
    end
end
