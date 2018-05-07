class ApplicationController < ActionController::Base

  before_action :configure_devise_params, if: :devise_controller?

 def configure_devise_params
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
 end

 def after_sign_in_path_for(resource)
   user_path
 end

 def only_logged_in
   if !user_signed_in?
     flash[:notice] = "Merci de vous connecter pour accéder à cette page."
     redirect_to new_user_session_path
   end
 end

end
