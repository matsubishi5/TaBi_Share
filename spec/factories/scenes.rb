Faker::Config.locale = :ja

FactoryBot.define do
  factory :scene do
    name { Faker::Lorem.characters(number: 10) }
  end
end