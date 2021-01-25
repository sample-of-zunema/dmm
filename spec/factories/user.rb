FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5) }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { 'aaaaaa' }
    password_confirmation { 'aaaaaa' }
  end
end