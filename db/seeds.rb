# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
User.destroy_all

user = User.create(
  phone_number: '14157696068',
  first_name: 'Mohamed',
  last_name: 'El Mahallawy',
  email: 'mmahalwy@gmail.com'
)

user.events.create(
  starts_at: DateTime.now + 1.hour,
  ends_at: DateTime.now + 2.hour,
  location: 'San Francisco',
  max_participants: 12,
  payment_type: :paypal,
  payment_link: 'https://paypal.com',
  cost_per_participant: 5,
)

user.events.create(
  starts_at: DateTime.now + 1.hour,
  ends_at: DateTime.now + 2.hour,
  location: 'San Diego',
  max_participants: 24,
  payment_type: :paypal,
  payment_link: 'https://paypal.com',
  cost_per_participant: 5,
)
