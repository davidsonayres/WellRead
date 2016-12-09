class AddingReferenceToMyBooks < ActiveRecord::Migration[5.0]
  def change
      add_reference :my_books, :editions
  end
end
