FactoryBot.define do
  factory :dataload_job do
    status { :scheduled }
    dataload_profile_id { 1 }
    created_by { "Foley O." }
    vendor
  end
end
