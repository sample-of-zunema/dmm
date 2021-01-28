FactoryBot.define do
  factory :inquiry do
    name { Faker::Lorem.characters(number: 5) }
    email { 'test2@tes2' }
    message { Faker::Lorem.characters(number: 30) }
  end
end
