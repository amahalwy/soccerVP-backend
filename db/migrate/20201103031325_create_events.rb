class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :location
      t.text :payment_link
      t.integer :payment_type
      t.integer :max_participants
      t.float :cost_per_participant

      t.timestamps
    end
  end
end
