json.jwt "Bearer " + @token
json.user do 
  json.id @user.id 
  json.email @user.email
  json.firstName @user.first_name
  json.lastName @user.last_name
  json.phoneNumber @user.phone_number
  json.otp_code_sent_at @user.otp_code_sent_at
  json.role @user.role
  json.events @user.events
end