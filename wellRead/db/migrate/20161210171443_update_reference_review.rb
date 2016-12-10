class UpdateReferenceReview < ActiveRecord::Migration[5.0]
  def change
      remove_reference :reviews, :my_books
      add_reference :reviews, :my_book
  end
end
