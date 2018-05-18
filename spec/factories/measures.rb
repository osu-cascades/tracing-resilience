FactoryBot.define do
  factory :measure do
    title "Example Measure Title"
    category :general
    document_file_name { 'fake.pdf' }
    document_content_type { 'application/pdf' }
    document_file_size { 1024 }

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
