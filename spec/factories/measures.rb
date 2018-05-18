FactoryBot.define do
  factory :measure do
    title "Example Measure Title"
    category 0
    document_file_name { 'fake.pdf' }
    document_content_type { 'application/pdf' }
    document_file_size { 1024 }

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
