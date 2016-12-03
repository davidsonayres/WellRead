class Library < ApplicationRecord

  has_many :my_books, through: :editions
  has_many :editions
  belongs_to :user

end
