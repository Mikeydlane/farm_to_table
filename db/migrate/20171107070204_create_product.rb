class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.float :price
      t.string :name
      t.string :description
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
