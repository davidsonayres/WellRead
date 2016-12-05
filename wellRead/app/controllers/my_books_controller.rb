class MyBooksController < ApplicationController

  def index
  end

  def new
    @my_book = MyBook.new
  end

  def create
    @my_book = MyBook.new(my_book_params)

    if @my_book.save
      redirect_to library_url
    else
      render :new
    end
  end

  def show
  end

  def edit
    @my_book = MyBook.find(params[:id])

    if @my_book.update_attributes(my_book_params)
      # insert flash alert that changes have been saved
      redirect_to :back
    else
      redirect_to :back
    end
  end

private

  def my_book_params
    params.require(:user).permit()
  end

end
