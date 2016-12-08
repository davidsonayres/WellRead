class Edition < ApplicationRecord
  belongs_to :book

  has_many :my_book

end
