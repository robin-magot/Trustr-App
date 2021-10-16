class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :url
      t.string :product_title
      t.string :product_image
      t.string :name
      t.string :string
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
