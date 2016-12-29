class QuotesController < ApplicationController
    def index
      @quotes = Quote.all
      @my_book = MyBook.find(params[:my_book_id])
    end

    def new
    @quote = Quote.new
    uploader = QuoteUploader.new
    @my_book = MyBook.find(params[:my_book_id])
    end

    def create
      @user = current_user
      @my_book = MyBook.where(user_id: @user.id)
      @quotes = Quote.where(user_id: @user.id)
      @quote = Quote.new(quote_params)
      uploader = QuoteUploader.new

    if @quote.save!
      # redirect_to my_book_url(params[:my_book_id])
      redirect_to my_book_quotes_path(params[:my_book_id])
    else
      render :new
      #above render I think is wrong.
    end
    end

    private

    def quote_params
    params.require(:quote).permit( :my_book_id, :quote, :image, :page)
    end

    end
