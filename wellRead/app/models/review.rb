class Review < ApplicationRecord

  belongs_to :user
  belongs_to :my_book

end
