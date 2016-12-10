class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

  def new
    @review = Review.new
  end

  def create
      @user = current_user
      @my_book = MyBook.where(user_id: @user.id)
      @reviews = Review.where(user_id: @user.id)
      @review = Review.new(review: params[:review][:review], my_book_id: params[:my_book_id])

    puts(review_params)
    if @review.save!
      redirect_to my_book_url(params[:my_book_id])
      #above redirect_to I think is wrong.
    else
      render :new
      #above render I think is wrong.
    end
  end

private

  def review_params
    params.require(:review).permit( :my_book_id, :review)
  end

end
