class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.integer :role

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :phone_number
    add_index :users, :role
  end
end
