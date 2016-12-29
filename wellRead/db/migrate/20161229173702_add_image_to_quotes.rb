class AddImageToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :image, :string
  end
end
