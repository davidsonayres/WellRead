class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

   private

   def current_user
     if User.all.count > 0
       @current_user ||= User.find(session[:user_id]) if session[:user_id]

     end
   end
   helper_method :current_user, :logged_in

   def logged_in
     if !current_user
       return "divLoginToggle()"
     else
       return "divReservationToggle()"
     end
   end


   helper_method :current_user, :logged_in
end
