class MyBooksController < ApplicationController

  def index
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
       @my_books = MyBook.where(user_id: @user.id)

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

  def searchtomybook
      @my_book = MyBook.find_by edition_id: params["edition_id"]
      if @my_book == nil
        @edition = Edition.find_by title: params["title"],author: params["author"]
          if @edition == nil
              @book = Book.find_by title: params["title"], author: params["author"]
              if @book == nil #no my book, no edition, no book
                  @book = Book.new
                  @book.title = params["title"]
                  @book.author = params["author"]
                  @book.save!

                  @edition = Edition.new
                  @edition.book_id = @book.id
                  @edition.title = params['title']
                  @edition.author = params['author']
                  @edition.edition = params['edition']
                  @edition.genre = params['genre']
                  @edition.numberOfPages = params['numberOfPages']
                  @edition.publicationDate = params['publicationDate']
                  @edition.publisher = params['publisher']
                  @edition.url = params['detailPageURL']
                  @edition.image = params['image']
                  @edition.save!

                  @my_book = MyBook.new
                  @my_book.edition_id = @edition.id
                  @my_book.user_id = @user
                  @my_book.save!


              else #book exists, no edition, no mybook
                  @edition = Edition.new
                  @edition.book_id = @book.id
                  @edition.title = params['title']
                  @edition.author = params['author']
                  @edition.edition = params['edition']
                  @edition.genre = params['genre']
                  @edition.numberOfPages = params['numberOfPages']
                  @edition.publicationDate = params['publicationDate']
                  @edition.publisher = params['publisher']
                  @edition.url = params['detailPageURL']
                  @edition.image = params['image']
                  @edition.save!

                  @my_book = MyBook.new
                  @my_book.edition_id = @edition.id
                  @my_book.user_id = @user
                  @my_book.save!
                end #end of if book doesn't exist

            end # end of if edition doesn't exist

          @my_book = MyBook.new
          @my_book.edition = @edition
          @my_book.user_id = current_user.id


      end #end of if my book doesn't exist
      unless MyBook.find_by(user_id:current_user.id, edition_id:@edition.id)

          @my_book.save
          @user = current_user
          @my_books = MyBook.where(user_id: @user.id)
        #   render 'my_books/show'
            redirect_to my_book_path(current_user)
      else
          @user = current_user
          @my_books = MyBook.where(user_id: @user.id)
        #   render 'my_books/show'
        redirect_to my_book_path(current_user)
      end
  end #end of method



private

  def my_book_params
    params.require(:user).permit(:edition_id)
  end

end
