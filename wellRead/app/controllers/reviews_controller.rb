class ReviewsController < ApplicationController
    before_action :find_my_book
    # before_action :find_book
    before_action :find_review, only: [:edit, :update, :destroy]
    def index
        @reviews = Review.all
        @review = Review.new(review: params[:review][:review], my_book_id: params[:my_book_id])
    end

  def new
    @review = Review.new
  end

  def create
      @user = current_user
      @my_book = MyBook.where(user_id: @user.id)
    #   Meg unsure if above line is needed?
      @reviews = Review.where(user_id: @user.id)
      @review = Review.new(review: params[:review][:review], my_book_id: params[:my_book_id])

    #   @review.my_book_id = @my_book.id

    if @review.save!
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
    if @review.update(review_params)
        # @review.save!
      # insert flash alert that changes have been saved
      redirect_to my_book_path(@my_book)
    else
     render 'edit'
    end
  end


  def destroy
      @review.destroy
      redirect_to my_book_path(@my_book)
  end

private

  def review_params
    params.require(:review).permit( :my_book_id, :review)
  end
  def edit_review_params
      params.require(:review).permit(:my_book_id, :review)
  end
  # def find_book
  #     @book = Book.find(params[:book_id])
  # end
  def find_my_book
      @my_book = MyBook.find(params[:my_book_id])
  end
  def find_review
      @review = Review.find(params[:id])
  end
end
