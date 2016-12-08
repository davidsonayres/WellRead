class Edition < ApplicationRecord
  belongs_to :book
  belongs_to :library
  has_many :my_book

end
