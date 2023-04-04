FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user#{n}-#{Time.zone.now.to_i}@stanford.edu"
    end
  end
end
