class QuotesController < ApplicationController
    before_action :find_my_book
    before_action :find_quote, only: [:edit, :update, :destroy]


    def index
        @quotes = Quote.all
    end

    def new
    @quote = Quote.new
    end

    def create
      @user = current_user
      @my_book = MyBook.where(user_id: @user.id)
      @quotes = Quote.where(user_id: @user.id)
      @quote = Quote.new(quote: params[:quote][:quote], my_book_id: params[:my_book_id])


        if @quote.save!
          redirect_to my_book_url(params[:my_book_id])
          #above redirect_to I think is wrong.
        else
          render :new
          #above render I think is wrong.
        end
    end

    def edit
    end

    def update
      if @quote.update(quote_params)
          # @quote.save!
        # insert flash alert that changes have been saved
        redirect_to my_book_path(@my_book)
      else
       render 'edit'
      end
    end


    def destroy
        @quote.destroy
        redirect_to my_book_path(@my_book)
    end

    private

    def quote_params
        params.require(:quote).permit( :my_book_id, :quote)
    end

    def find_my_book
        @my_book = MyBook.find(params[:my_book_id])
    end
    def find_quote
        @quote = Quote.find(params[:id])
    end
end
