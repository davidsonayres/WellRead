class MyBook < ApplicationRecord

  # belongs_to :library
  belongs_to :edition
  # lending
  has_many :reviews
  has_many :quotes
  has_many :books, through: :editions

  accepts_nested_attributes_for :reviews



end
