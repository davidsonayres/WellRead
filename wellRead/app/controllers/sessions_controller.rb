class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to library_path(user.id)
      else
        redirect_to root_url
      end

    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url
    end

    private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
