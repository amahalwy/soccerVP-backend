class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tables do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.string :email, null: false
      t.string :session_token, null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end
