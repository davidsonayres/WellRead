class ChangeNameofBooksId < ActiveRecord::Migration[5.0]
  def change
      rename_column :editions, :books_id, :book_id
      remove_column :books, :editions_id
  end
end
