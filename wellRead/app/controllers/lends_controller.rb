class LendsController < ApplicationController
    before_action :find_lend, only: [:destroy]


    def index
        @lend = Lend.new(lend_params)
        @user = current_user
        @my_book = MyBook.find(params[:my_book_id])
        @borrows = Borrow.all
        @borrow = Borrow.new(borrow_params)
    end

    def new
        @lend = Lend.new(lend_params)
        @my_book = MyBook.find(params[:my_book_id])
        @lend.my_book_id = params[:my_book_id]
    end

    def create
        @user = current_user
        @my_book = MyBook.where(user_id: @user.id)
        @lend = Lend.new(lend_params)
        @lend.my_book_id = params[:my_book_id]

        if @lend.save!
            redirect_to my_book_url(params[:my_book_id])
        else
            render :new
        end
    end

    def destroy
        @lend.destroy
        redirect_to my_book_path(params[:my_book_id])
    end

    private

    def lend_params
    params.permit( :my_book_id, :friend)
    end

    def find_lend
        @lend = Lend.find_by(my_book_id: params[:id])
    end

end
