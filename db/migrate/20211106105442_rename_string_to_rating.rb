class RenameStringToRating < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :string, :rating
  end
end
