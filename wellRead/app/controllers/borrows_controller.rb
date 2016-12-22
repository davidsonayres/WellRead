class BorrowsController < ApplicationController
    def index
        @borrows = Borrow.all
        @borrow = Borrow.new(borrow_params)
        @user = current_user
    end

    def new
        @borrow = Borrow.new(borrow_params)
    end

    def create
      @user = current_user
      @borrows = Borrow.where(user_id: @user.id)
      @borrow = Borrow.new(borrow_params)

        if @borrow.save!
          redirect_to my_book_lends_path

        else
          render :new

        end
    end
    private

    def borrow_params
    params.permit( :title, :friend)
    end

end
