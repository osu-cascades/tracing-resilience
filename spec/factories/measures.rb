FactoryBot.define do
  factory :measure do
    title "Example Measure Title"
    category :general
    featured false
    after(:build) do |measure|
      measure.document.attach(io: File.open(Rails.root.join('spec', 'factories', 'attachments', 'example.pdf')), filename: 'example.pdf', content_type: 'application/pdf')
    end

    factory :featured_measure do
      featured true
    end

    factory :individual_measure do
      category :individual
    end

    factory :relational_measure do
      category :relational
    end

    factory :community_measure do
      category :community
    end
  end
end
