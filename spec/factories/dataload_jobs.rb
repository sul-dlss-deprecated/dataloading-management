FactoryBot.define do
  factory :dataload_job do
    status { :scheduled }
    dataload_profile_id { SecureRandom.uuid }
    interface_id { SecureRandom.uuid }
    created_by { "Foley O." }
    vendor

    trait :recurs_daily_yesterday do
      recurrence { :daily }
      date { 1.days.ago }
    end

    trait :recurs_daily_tomorrow do
      recurrence { :daily }
      date { 1.days.from_now }
    end
  end
end
