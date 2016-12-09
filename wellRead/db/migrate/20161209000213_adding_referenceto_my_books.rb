class AddingReferencetoMyBooks < ActiveRecord::Migration[5.0]
  def change
      add_reference :my_books, :users
  end
end
