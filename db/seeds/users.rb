# frozen_string_literal: true

Rails.logger.debug 'Seeding Users'

User.create(
  username: 'admin',
  first_name: 'Admin',
  last_name: 'Admin',
  email: 'admin@admin.com',
  password: '1234567890'
)

10.times do
  User.create(
    username: Faker::Internet.username(specifier: 8..12),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(domain: 'localhost.lan'),
    password: Faker::Internet.password(min_length: 8)
  )
end
