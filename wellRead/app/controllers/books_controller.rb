class BooksController < ApplicationController

  def index
  end

  def show
    @conversations = Conversation.all
    @book = Book.find(params[:id])
    @edition =  @book.editions.last
  end


    def new
        @book = Book.new
    end

    def create
      @book = Book.new

      if @book.save
        redirect_to show_url
      else
        render :new
      end
    end

    def conversations
        @conversation
    end
    def conversations_attributes=(attributes)
    end



    def search


        request = Vacuum.new('CA')
        # Vacuum::Response.parse

        request.configure(

    aws_access_key_id: Figaro.env.access_id,
    aws_secret_access_key: Figaro.env.access_key,
    associate_tag: Figaro.env.associate_tag
)


        response = request.item_search(
            query: {
                'SearchIndex' => 'Books',
                'Keywords' => params[:q],
                'ResponseGroup' => "ItemAttributes,Images"
            }
        )
        # response.to_h["ItemSearchResponse"]["Items"].each do |item|
        # #   puts item.inspect
        # end

        hashed_products = response.to_h

        @results = []


        hashed_products['ItemSearchResponse']['Items']['Item'].each do |item|
            result = Edition.new
            result.title = item['ItemAttributes']['Title']
            result.author = item['ItemAttributes']['Author']
            result.edition = item['ItemAttributes']['Edition']
            result.genre = item['ItemAttributes']['Genre']
            result.numberOfPages = item['ItemAttributes']['NumberOfPages']
            result.publicationDate = item['ItemAttributes']['PublicationDate']
            result.publisher = item['ItemAttributes']['Publisher']
            result.url = item['DetailPageURL']
            result.image = item['LargeImage']['URL'] if item['LargeImage']
            @results << result
        end
        # puts @results.inspect
    end

    def new_edition
        @edition = Edition.new(edition_params)
        @edition.book_id = @book.id
        @edition.save!
    end

    def searchtobook
        @edition = Edition.find_by title: params["title"], author: params["author"]
        if @edition == nil
            @book = Book.find_by title: params["title"], author: params["author"]
                if @book == nil
                    @book = Book.new(book_params)
                    @book.save!

                    new_edition

                else
                    new_edition
                end
        end
        redirect_to edition_path(@edition)

    end

private
    def book_params
        params.permit(:title, :author)
    end

    def edition_params
        params.permit(:book_id, :title, :author, :edition, :genre, :numberOfPages, :publicationDate, :publisher, :url, :image)
    end
end #end of Class
