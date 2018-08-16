class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  
  around_action :set_time_zone, if: :user_time_zone_present?
 
  private
    def set_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end
 
    def user_time_zone_present?
      current_user.try(:time_zone).present?
    end
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
