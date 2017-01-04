class EditionsController < ApplicationController
    def index
        @editions = Editions.all
    end

    def show
        @editions = Edition.all
        @edition = Edition.find(params[:id])
        @conversations = Conversation.all
        @book = Book.find(@edition.book_id)
        

        if @book.ratings.blank?
            @average_rating = 0
        else
            @average_rating = @book.ratings.average(:rating).round(2).to_i
            # raise "hi meg"
        end


    end

    def new
        @edition = Edition.new
    end

    def create
      @edition = Edition.new(edition_params)

      if @edition.save
        redirect_to editions_path(@editions)
      end
    end

    private
    def edition_params
      params.require(:edition).permit(
      :title,
      :author,
      :edition,
      :genre,
      :numberOfPages,
      :publicationDate,
      :publisher,
      :url,
      :image)
    end
end
