class MyBooksController < ApplicationController
    before_action :find_lend, only: [:show]

  def index
    @user = current_user
    @my_books = MyBook.where(user_id: @user.id)
    @reviews = Review.where(user_id: @user.id)
    @quotes = Quote.where(user_id: @user.id)
    # @my_search = MyBook.search(params[:search])
    #   if @my_search.size == 0
    #     @my_search = @my_books
    #   end
    #   respond_to do |format|
    #     format.html
    #     format.json { render json: @my_search }
    #   end
    # raise "hi meg"
  end

  def new
    @my_book = MyBook.new
  end

  def create
    @my_book = MyBook.new(my_book_params)

    if @my_book.save
      redirect_to library_url
    else
      render :new
    end


  end

  def show
    @user = current_user
    @my_book = MyBook.find(params[:id])
    # @my_books = Edition.where(user_id: @user.id)
    # @edition = Edition.find_by(edition_id: edition_id)
    @reviews = Review.where(user_id: @user.id)
    @quotes = Quote.where(user_id: @user.id)
    @rating = Rating.find_by(user_id: @user.id, book_id: @my_book.edition.book_id)

  end

    def edit
    @my_book = MyBook.find(params[:id])
        if @my_book.update_attributes(my_book_params)
            # insert flash alert that changes have been saved
            redirect_to :back
        else
            redirect_to :back
        end
    end

    def new_edition
        @edition = Edition.new(edition_params)
        @edition.book_id = @book.id
        @edition.save!
    end

    def new_mybook
        @my_book = MyBook.new(my_book_params)
        @my_book.edition_id = @edition.id
        @my_book.user_id = @user.id
        @my_book.save!
    end

    def new_book
        @book = Book.new(book_params)
        @book.save!
    end

    def searchtomybook
    @user = current_user
    @my_book = MyBook.find_by edition_id: params["edition_id"]
        if @my_book == nil
            @edition = Edition.find_by title: params["title"],author: params["author"]
                if @edition == nil
                    @book = Book.find_by title: params["title"], author: params["author"]
                    if @book == nil #no my book, no edition, no book
                        new_book

                        new_edition

                        new_mybook

                    else #book exists, no edition, no mybook
                        new_edition

                        new_mybook

                    end #end of if book doesn't exist

                end # end of if edition doesn't exist
            new_mybook

        end #end of if my book doesn't exist
        unless MyBook.find_by(user_id:current_user.id, edition_id:@edition.id)

            @my_book.save!
            @my_books = MyBook.where(user_id: current_user.id)
            redirect_to my_book_path(@my_book.id)
        else
            @user = current_user
            @my_books = MyBook.where(user_id: @user.id)
            redirect_to my_book_path(@my_book.id)
        end
    end #end of method

private

    def my_book_params
        params.permit(:edition_id)
    end

    def book_params
      params.permit(:title, :author)
    end

    def edition_params
        params.permit(:book_id, :title, :author, :edition, :genre, :numberOfPages, :publicationDate, :publisher, :url, :image)
    end

    def find_lend
        @lend = Lend.find_by(my_book_id: params[:id])
    end

end #end of Class
