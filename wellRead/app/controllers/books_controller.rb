class BooksController < ApplicationController

  def index
  end

  def show
      @test = "hello"
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
            result.image = item['MediumImage']['URL'] if item['MediumImage']
            @results << result
        end
        puts @results.inspect
    end

    def searchtobook
        @edition = Edition.find_by title: params["title"]
        if @edition == nil
            @edition = Edition.create
            @edition.title = params['title']
            @edition.author = params['Author']
            @edition.edition = params['Edition']
            @edition.genre = params['Genre']
            @edition.numberOfPages = params['NumberOfPages']
            @edition.publicationDate = params['PublicationDate']
            @edition.publisher = params['Publisher']
            @edition.url = params['DetailPageURL']
            @edition.image = params['MediumImage']

        end
        render 'books/show'
    end

    def searchtomybook
        @edition = Edition.find_by name: [searchtomybook.name]
        if @edition= nil
            @edition = Edition.create && My_book.create
            @edition.title = params['title']
            @edition.author = params['Author']
            @edition.edition = params['Edition']
            @edition.genre = params['Genre']
            @edition.numberOfPages = params['NumberOfPages']
            @edition.publicationDate = params['PublicationDate']
            @edition.publisher = params['Publisher']
            @edition.url = params['DetailPageURL']
            @edition.image = params['MediumImage']

        end
        render 'my_books/show'
    end
end
