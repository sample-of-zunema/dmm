FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5) }
    email { 'test@test' }
    password { Faker::Lorem.characters(number:6) }
  end
end