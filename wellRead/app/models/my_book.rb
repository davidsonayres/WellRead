class MyBook < ApplicationRecord

  # belongs_to :library
  belongs_to :edition
  has_one :lend
  has_many :reviews
  has_many :quotes
  has_many :books, through: :editions

  accepts_nested_attributes_for :reviews
  accepts_nested_attributes_for :quotes
  accepts_nested_attributes_for :lend

  def self.search(search)
    MyBook.fuzzy_search(search)
    end

end
