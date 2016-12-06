class BooksController < ApplicationController

  def index
  end

  def show
  end



    def search
        request = Vacuum.new('CA')
        request.configure(
    aws_access_key_id: Figaro.env.access_id,
    aws_secret_access_key: Figaro.env.access_key,
    associate_tag: 'tag'
)

        response = request.item_search(
            query: {
                'Keywords' => 'Graphic Design',
                'SearchIndex' => 'Books'
        }
      )
     response.to_h["ItemSearchResponse"]["Items"].each do |item|
         puts item.inspect
         end
    end

end
