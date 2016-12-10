class AddingReviewReference < ActiveRecord::Migration[5.0]
  def change
      add_reference :reviews, :mybooks
  end
end
