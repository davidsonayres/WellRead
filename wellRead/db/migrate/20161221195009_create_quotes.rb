class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.text :quote
      t.references :my_book
      t.integer :page

      t.timestamps
    end
  end
end
