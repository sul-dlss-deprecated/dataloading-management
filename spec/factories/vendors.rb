FactoryBot.define do
  factory :vendor do
    folio_id { SecureRandom.uuid }
    folio_code { "SFSYMPHONY-SUL" }
    name { "San Francisco Symphony" }
    highlight { false }
  end
end
