class BorrowsController < ApplicationController
    def index
        @borrows = Borrow.all
        @borrow = Borrow.new(borrow_params)
        @user = current_user
    end

    def new
        @borrow = Borrow.new
        @user = current_user
        @borrows = Borrow.all
    end

    def create
      @user = current_user
      @borrow = Borrow.new(borrow_params)
      @borrows = Borrow.where(user_id: @user.id)
      @borrow.user_id = params[:user_id]

        if @borrow.save!
          redirect_to user_path(params[:user_id])

        else
          render :new

        end
    end
    private

    def borrow_params
    params.require(:borrow).permit(:borrow, :friend, :title)
    end

end
