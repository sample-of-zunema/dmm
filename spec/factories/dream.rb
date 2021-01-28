FactoryBot.define do
  factory :dream do
    user
    emotion { '楽しい' }
    start_time { DateTime.strptime('01/01/2021 10:00', '%m/%d/%Y %H:%M') }
    title { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 30) }
  end
end
