FactoryBot.define do
  factory :user do
    email 'example@example.com'
    password 'password'
    password_confirmation 'password'
    role 0
    first_name 'Guest'
    last_name 'User'
    organization 'Example Organization'
    city 'Example City'
    state 'Example State'
    zip '97701'
    phone '555-555-5555'
    terms_of_use '1' # validates_acceptance_of :terms_of_use

    factory :admin do
      first_name 'Admin'
      role 1
      email 'admin@example.com'
    end

  end
end
