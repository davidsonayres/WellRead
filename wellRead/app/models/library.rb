class Library < ApplicationRecord

  has_many :my_books
  belongs_to :user

end
