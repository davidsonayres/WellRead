class MyBook < ApplicationRecord

  # belongs_to :library
  belongs_to :edition
  # lending
  has_many :reviews
  # guotes
  has_many :books, through: :editions

end
