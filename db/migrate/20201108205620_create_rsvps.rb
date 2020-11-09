class CreateRsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :event_id
      t.timestamps
    end
    add_index :rsvps, :user_id
    add_index :rsvps, :eventr_id
  end
end
