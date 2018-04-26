FactoryBot.define do
  factory :general_measure do
    title "Example Measure Title"
    category 0
    document ''
  end

  factory :individual_measure, parent: :general_measure do
    role 1
  end

  factory :relational_measure, parent: :general_measure do
    role 2
  end

  factory :community_measure, parent: :general_measure do
    role 4
  end
end
