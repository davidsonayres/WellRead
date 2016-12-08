class AddBookReferencewithEditions < ActiveRecord::Migration[5.0]
  def change
      add_reference :books, :editions
  end
end
