class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    print(review_params)
    if @review.save
      redirect_to my_books_path
      #above redirect_to I think is wrong.
    else
      render :new
      #above render I think is wrong.
    end
  end

private

  def review_params
    params.require(:review).permit(:users_id, :my_book_id, :review)
  end

end
