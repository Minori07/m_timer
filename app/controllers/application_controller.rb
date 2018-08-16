class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
    end

    def after_sign_in_path_for(resource_or_scope)
	    tasks_alarm_path
  	end

  	def after_sign_out_path_for(resource_or_scope)
  		home_index_path
  	end

end
