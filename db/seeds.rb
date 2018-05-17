User.create(
  email: "example@example.com",
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Developer',
  last_name: "Admin",
  organization: "My Organization",
  city: "My City",
  state: "My State",
  zip: "12345",
  role: :admin
)

puts "Default admin user created with email 'example@example.com' and password 'password'."
