class QuotesController < ApplicationController
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

    private

    def quote_params
    params.require(:quote).permit( :my_book_id, :quote)
    end

    end
