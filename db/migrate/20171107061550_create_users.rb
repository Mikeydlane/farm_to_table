class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :city
      t.text :description
      t.string :user_type, default: 'Table'

      t.timestamps
    end
  end
end
