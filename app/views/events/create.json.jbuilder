json.user do 
  json.id @event.user.id 
  json.email @event.user.email
  json.firstName @event.user.first_name
  json.lastName @event.user.last_name
  json.phoneNumber @event.user.phone_number
  json.otp_code_sent_at @event.user.otp_code_sent_at
  json.role @event.user.role
  json.events @event.user.events
end