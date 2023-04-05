FactoryBot.define do
  factory :vendor do
    folio_id { SecureRandom.uuid }
    sequence(:folio_code) { |n| "FC-#{n}" }
    sequence(:name) { |n| "Vendor #{n}" }
    highlight { false }
  end
end
