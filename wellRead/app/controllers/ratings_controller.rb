class RatingsController < ApplicationController
    # before_action :find_book
    before_action :find_rating, only: [:edit, :update, :destroy]

    def index
    end

    def new
    @rating = Rating.new
    end

    def create
      @user = current_user
    #   @book = Book.find(params[:book_id])
    #  @rating = Rating.where(user_id: @user.id)
      @rating = Rating.new(rating_params)
      @rating.user = @user

    if @rating.save!
        
      redirect_to :back
      #above redirect_to I think is wrong.
    else
      render :new
      #above render I think is wrong.
    end
    end

    def edit
    end

    def update
    end


    def destroy
      @rating.destroy
      redirect_to my_book_path(@my_book)
    end


    private

    def rating_params
    params.require(:rating).permit( :book_id, :rating)
    end
    # def find_book
    #     @book = Book.find(params[:book_id])
    # end
    def find_rating
      @rating = Rating.find(params[:id])
    end

end
