class AddHighlightColumnToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :highlight, :string
  end
end
