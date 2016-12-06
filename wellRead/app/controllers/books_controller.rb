class BooksController < ApplicationController

  def index
  end

  def show
  end

  # def user_search
  #     user_search =
    def new
        @book = Book.new
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
            # result.price = item['ItemAttributes']['ListPrice']['FormattedPrice'] if item['ItemAttributes']['ListPrice']
            # result.url = item['DetailPageURL']
            # result.feature = item['ItemAttributes']['Feature']
            result.image = item['SmallImage']['URL'] if item['SmallImage']
            # result.link = item['ItemLinks']['ItemLink'][5]['URL']
            @results << result
        end
        puts @results.inspect
    end
end
