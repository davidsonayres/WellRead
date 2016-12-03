class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    # profile page
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      # insert flash alert that changes have been saved
      redirect_to :back
    else
      redirect_to :back
    end
  end

private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation, :username)
  end

end