class LibrariesController < ApplicationController
    def show
        @user = current_user
        @my_books = MyBook.where(user_id: @user.id)
        
    end
end
