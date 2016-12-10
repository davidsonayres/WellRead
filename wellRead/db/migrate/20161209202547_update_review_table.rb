class UpdateReviewTable < ActiveRecord::Migration[5.0]
  def change
      remove_reference :reviews, :mybooks
      add_reference :reviews, :my_books
  end
end
