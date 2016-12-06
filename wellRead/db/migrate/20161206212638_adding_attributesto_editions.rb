class AddingAttributestoEditions < ActiveRecord::Migration[5.0]
  def change
      add_column :editions, :edition, :string
      add_column :editions, :genre, :string
      add_column :editions, :numberOfPages, :integer
      add_column :editions, :publicationDate, :date
      add_column :editions, :publisher, :string
      add_column :editions, :url, :string
  end
end
