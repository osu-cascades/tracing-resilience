FactoryBot.define do
  factory :user do
    email 'example@example.com'
    password 'password'
    password_confirmation 'password'
    role 0
    first_name 'Example First Name'
    last_name 'Example Last Name'
    organization 'Example Organization'
    city 'Example City'
    state 'Example State'
    zip '97701'
    phone '555-555-5555'
    # virtual attribute, '1' => has checked terms of service
    terms_of_service '1'
  end

  factory :admin, parent: :user do
    role 1
  end
end
