class UsersController < ApplicationController

  def index
    #   @my_books = MyBook.search(params[:search])
    #     if @my_books.size == 0
    #       @my_books = MyBook.all
    #     end
    #     respond_to do |format|
    #       format.html
    #       format.json { render json: @my_books }
    #     end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to library_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def update
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
