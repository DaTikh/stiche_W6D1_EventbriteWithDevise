class ApplicationController < ActionController::Base

  before_action :configure_devise_params, if: :devise_controller?
  before_action :set_timezone

 def set_timezone
    Time.zone = "CET"
 end


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
   else
     @user = current_user
   end
 end

 def events_aging(events)
   @upcoming = []
   @past = []
   events.each do |event|
     if event.date > Time.now
       @upcoming << event
     else
       @past << event
     end
   end
 end

 end
