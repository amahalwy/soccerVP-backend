class AddOtpToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :otp_secret_key, :string
    add_column :users, :otp_code_sent_at, :datetime
  end
end
