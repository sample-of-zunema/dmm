FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5) }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { Faker::Lorem.characters(number:6) }
  end
end