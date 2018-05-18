FactoryBot.define do
  factory :measure do
    title "Example Measure Title"
    category 0
    document { File.new("#{Rails.root}/spec/support/fixtures/measure.pdf") }

    factory :individual_measure do
      category 1
    end

    factory :relational_measure do
      category 2
    end

    factory :community_measure do
      category 4
    end
  end
end
