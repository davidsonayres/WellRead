class Review < ApplicationRecord


  belongs_to :my_book, foreign_key: :my_book_id
 
end
