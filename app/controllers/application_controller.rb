class ApplicationController < ActionController::Base
	rescue_from ActionController::RoutingError, with: :render_404
	rescue_from ActiveRecord::RecordNotFound, with: :render_404
  #before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!

	layout :layout_by_resource
  protected
#     def configure_permitted_parameters
# 			devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation)}
# 			devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
#   	end
  def after_sign_in_path_for(resource)
		if resource.status == true
			@store= current_user.store
			stored_location_for(resource) || store_path(@store)
		else
			@store= current_user.store
			stored_location_for(resource) || store_path(@store)
		end
	end


	private
	def layout_by_resource
		if devise_controller?
			"devise"
		else
			"application"
		end
	end
	def render_404(exception = nil)
		if exception
			logger.info "Rendering 404: #{exception.message}"
		end
		render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
	end

	def not_found
		raise ActionController::RoutingError.new('Not Found')
	end
end


