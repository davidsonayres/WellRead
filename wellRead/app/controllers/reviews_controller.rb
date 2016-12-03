class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
  print(review_params)
    if @review.save
      redirect_to root_url
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:users_id, :my_book_id, :review)
  end

end
