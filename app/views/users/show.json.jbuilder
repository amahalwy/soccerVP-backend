json.extract! @user, :id, :email, :first_name, :last_name, :role, :otp_code_sent_at, :phone_number
json.events @user.events