class ApplicationController < ActionController::Base

      protect_from_forgery with: :exception
    #protect_from_forgery with: :null_session
    #protect_from_forgery prepend: true

   private

   def current_user
     if User.all.count > 0
       @current_user ||= User.find(session[:user_id]) if session[:user_id]

     end
   end
   helper_method :current_user

   def logged_in
   end

end
